; DESCRIPTION: Renders a green line between points (126, 11) and (230, 195).
; PLAN: r0=126(x1), r1=11(y1), r2=230(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 11
LDI r2, 230
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
