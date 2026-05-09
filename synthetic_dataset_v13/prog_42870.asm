; DESCRIPTION: Composite: Draws a orange line from (58, 73) to (401, 102) then Places a orange circle of radius 28 at center (363, 42) then Sets a single white pixel at (102, 199).
; PLAN: r0=58(x1), r1=73(y1), r2=401(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=363(x), r6=42(y), r7=28(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=102(x), r11=199(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 58
LDI r1, 73
LDI r2, 401
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 42
LDI r7, 28
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 102
LDI r11, 199
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
