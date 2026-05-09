; DESCRIPTION: Renders a green line between points (301, 236) and (258, 252).
; PLAN: r0=301(x1), r1=236(y1), r2=258(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 236
LDI r2, 258
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
