; DESCRIPTION: Draws a yellow line from (199, 182) to (125, 83).
; PLAN: r0=199(x1), r1=182(y1), r2=125(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 182
LDI r2, 125
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
