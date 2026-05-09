; DESCRIPTION: Renders a purple line between points (90, 223) and (284, 184).
; PLAN: r0=90(x1), r1=223(y1), r2=284(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 223
LDI r2, 284
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
