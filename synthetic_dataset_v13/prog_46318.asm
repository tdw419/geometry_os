; DESCRIPTION: Renders a green line between points (176, 120) and (499, 83).
; PLAN: r0=176(x1), r1=120(y1), r2=499(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 120
LDI r2, 499
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
