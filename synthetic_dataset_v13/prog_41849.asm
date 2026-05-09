; DESCRIPTION: Renders a green line between points (308, 65) and (87, 209).
; PLAN: r0=308(x1), r1=65(y1), r2=87(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 65
LDI r2, 87
LDI r3, 209
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
