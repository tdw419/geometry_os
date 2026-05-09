; DESCRIPTION: Composite: Creates a cyan rectangular region at (196, 55) spanning 53 by 67 pixels then Draws a red circle centered at (150, 54) with radius 44 then Places a cyan dot at position (437, 120).
; PLAN: r0=196(x), r1=55(y), r2=53(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=150(x), r6=54(y), r7=44(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=437(x), r11=120(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 196
LDI r1, 55
LDI r2, 53
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 54
LDI r7, 44
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 437
LDI r11, 120
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
