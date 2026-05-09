; DESCRIPTION: Places a white line segment connecting (177, 210) to (358, 192).
; PLAN: r0=177(x1), r1=210(y1), r2=358(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 210
LDI r2, 358
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
