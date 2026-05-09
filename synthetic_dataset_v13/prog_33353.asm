; DESCRIPTION: Renders a green line between points (361, 152) and (307, 77).
; PLAN: r0=361(x1), r1=152(y1), r2=307(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 152
LDI r2, 307
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
