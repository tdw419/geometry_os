; DESCRIPTION: Composite: Renders a magenta line between points (348, 69) and (429, 143) then Sets a single cyan pixel at (479, 229) then Places a white circle of radius 55 at center (337, 170).
; PLAN: r0=348(x1), r1=69(y1), r2=429(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=479(x), r6=229(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=337(x), r11=170(y), r12=55(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 348
LDI r1, 69
LDI r2, 429
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 479
LDI r6, 229
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 337
LDI r11, 170
LDI r12, 55
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
