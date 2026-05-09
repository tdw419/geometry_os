; DESCRIPTION: Renders a red line between points (72, 195) and (351, 150).
; PLAN: r0=72(x1), r1=195(y1), r2=351(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 195
LDI r2, 351
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
