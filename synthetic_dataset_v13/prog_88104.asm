; DESCRIPTION: Draws a white line from (417, 103) to (498, 248).
; PLAN: r0=417(x1), r1=103(y1), r2=498(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 103
LDI r2, 498
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
