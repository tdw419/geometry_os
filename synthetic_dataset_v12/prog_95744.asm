; DESCRIPTION: Composite: Draws a green line from (253, 157) to (389, 126) then Renders a cyan disk with center (401, 143) and radius 55 then Places a orange dot at position (227, 79).
; PLAN: r0=253(x1), r1=157(y1), r2=389(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=401(x), r6=143(y), r7=55(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=227(x), r11=79(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 253
LDI r1, 157
LDI r2, 389
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 143
LDI r7, 55
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 227
LDI r11, 79
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
