; DESCRIPTION: Composite: Draws a cyan circle centered at (255, 108) with radius 66 then Places a red dot at position (303, 0) then Renders a cyan box of size 92x83 starting at (295, 54).
; PLAN: r0=255(x), r1=108(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=303(x), r6=0(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=295(x), r11=54(y), r12=92(width), r13=83(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 108
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 303
LDI r6, 0
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 295
LDI r11, 54
LDI r12, 92
LDI r13, 83
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
