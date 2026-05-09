; DESCRIPTION: Renders a green line between points (359, 56) and (160, 42).
; PLAN: r0=359(x1), r1=56(y1), r2=160(x2), r3=42(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 56
LDI r2, 160
LDI r3, 42
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
