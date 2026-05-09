; DESCRIPTION: Draws a white line from (373, 112) to (417, 210).
; PLAN: r0=373(x1), r1=112(y1), r2=417(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 112
LDI r2, 417
LDI r3, 210
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
