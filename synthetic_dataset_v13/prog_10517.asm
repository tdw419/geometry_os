; DESCRIPTION: Composite: Draws a cyan line from (84, 40) to (64, 3) then Sets a single white pixel at (205, 43).
; PLAN: r0=84(x1), r1=40(y1), r2=64(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=43(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 84
LDI r1, 40
LDI r2, 64
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 43
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
