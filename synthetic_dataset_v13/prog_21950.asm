; DESCRIPTION: Renders a green line between points (220, 16) and (45, 56).
; PLAN: r0=220(x1), r1=16(y1), r2=45(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 16
LDI r2, 45
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
