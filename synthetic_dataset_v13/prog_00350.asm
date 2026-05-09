; DESCRIPTION: Renders a green line between points (287, 82) and (511, 16).
; PLAN: r0=287(x1), r1=82(y1), r2=511(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 82
LDI r2, 511
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
