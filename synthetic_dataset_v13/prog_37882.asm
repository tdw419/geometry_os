; DESCRIPTION: Renders a yellow line between points (434, 8) and (353, 27).
; PLAN: r0=434(x1), r1=8(y1), r2=353(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 8
LDI r2, 353
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
