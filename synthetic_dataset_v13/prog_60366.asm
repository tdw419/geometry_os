; DESCRIPTION: Renders a green line between points (18, 10) and (28, 83).
; PLAN: r0=18(x1), r1=10(y1), r2=28(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 10
LDI r2, 28
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
