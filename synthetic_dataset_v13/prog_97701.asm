; DESCRIPTION: Composite: Draws a yellow circle centered at (470, 163) with radius 20 then Renders a cyan box of size 34x72 starting at (2, 138) then Places a cyan dot at position (371, 77).
; PLAN: r0=470(x), r1=163(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=2(x), r6=138(y), r7=34(width), r8=72(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=371(x), r11=77(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 470
LDI r1, 163
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 2
LDI r6, 138
LDI r7, 34
LDI r8, 72
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 77
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
