; DESCRIPTION: Renders a green line between points (71, 22) and (307, 229).
; PLAN: r0=71(x1), r1=22(y1), r2=307(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 22
LDI r2, 307
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
