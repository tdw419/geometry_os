; DESCRIPTION: Draws a green line from (402, 68) to (50, 81).
; PLAN: r0=402(x1), r1=68(y1), r2=50(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 68
LDI r2, 50
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
