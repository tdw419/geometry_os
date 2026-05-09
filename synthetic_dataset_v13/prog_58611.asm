; DESCRIPTION: Renders a green line between points (109, 132) and (16, 28).
; PLAN: r0=109(x1), r1=132(y1), r2=16(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 132
LDI r2, 16
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
