; DESCRIPTION: Renders a green line between points (94, 186) and (307, 227).
; PLAN: r0=94(x1), r1=186(y1), r2=307(x2), r3=227(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 186
LDI r2, 307
LDI r3, 227
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
