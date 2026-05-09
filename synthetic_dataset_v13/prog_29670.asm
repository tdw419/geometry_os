; DESCRIPTION: Renders a green line between points (68, 86) and (393, 236).
; PLAN: r0=68(x1), r1=86(y1), r2=393(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 86
LDI r2, 393
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
