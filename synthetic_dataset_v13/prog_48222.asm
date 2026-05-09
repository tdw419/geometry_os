; DESCRIPTION: Renders a purple line between points (404, 231) and (126, 199).
; PLAN: r0=404(x1), r1=231(y1), r2=126(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 231
LDI r2, 126
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
