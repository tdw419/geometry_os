; DESCRIPTION: Renders a green line between points (352, 176) and (211, 82).
; PLAN: r0=352(x1), r1=176(y1), r2=211(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 176
LDI r2, 211
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
