; DESCRIPTION: Renders a green line between points (144, 176) and (31, 215).
; PLAN: r0=144(x1), r1=176(y1), r2=31(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 176
LDI r2, 31
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
