; DESCRIPTION: Renders a green line between points (87, 176) and (84, 42).
; PLAN: r0=87(x1), r1=176(y1), r2=84(x2), r3=42(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 176
LDI r2, 84
LDI r3, 42
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
