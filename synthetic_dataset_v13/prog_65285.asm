; DESCRIPTION: Renders a green line between points (50, 28) and (54, 90).
; PLAN: r0=50(x1), r1=28(y1), r2=54(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 28
LDI r2, 54
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
