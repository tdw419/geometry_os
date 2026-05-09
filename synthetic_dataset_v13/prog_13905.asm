; DESCRIPTION: Composite: Draws a white line from (508, 211) to (247, 156) then Renders a cyan disk with center (250, 45) and radius 42 then Draws a red rectangle at (397, 40) with width 28 and height 115.
; PLAN: r0=508(x1), r1=211(y1), r2=247(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=250(x), r6=45(y), r7=42(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=397(x), r11=40(y), r12=28(width), r13=115(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 508
LDI r1, 211
LDI r2, 247
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 45
LDI r7, 42
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 397
LDI r11, 40
LDI r12, 28
LDI r13, 115
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
