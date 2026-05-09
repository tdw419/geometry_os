; DESCRIPTION: Draws a green line from (294, 175) to (498, 112).
; PLAN: r0=294(x1), r1=175(y1), r2=498(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 175
LDI r2, 498
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
