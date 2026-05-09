; DESCRIPTION: Composite: Renders a black line between points (392, 161) and (349, 54) then Places a orange 20x89 rectangle at position (393, 157) then Sets a single white pixel at (32, 43).
; PLAN: r0=392(x1), r1=161(y1), r2=349(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=393(x), r6=157(y), r7=20(width), r8=89(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=32(x), r11=43(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 392
LDI r1, 161
LDI r2, 349
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 157
LDI r7, 20
LDI r8, 89
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 32
LDI r11, 43
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
