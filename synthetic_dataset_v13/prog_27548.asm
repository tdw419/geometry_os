; DESCRIPTION: Composite: Draws a black line from (90, 63) to (485, 18) then Places a orange 36x24 rectangle at position (317, 31) then Sets a single white pixel at (162, 220).
; PLAN: r0=90(x1), r1=63(y1), r2=485(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=31(y), r7=36(width), r8=24(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=162(x), r11=220(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 90
LDI r1, 63
LDI r2, 485
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 31
LDI r7, 36
LDI r8, 24
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 220
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
