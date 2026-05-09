; DESCRIPTION: Renders a yellow line between points (64, 207) and (16, 50).
; PLAN: r0=64(x1), r1=207(y1), r2=16(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 207
LDI r2, 16
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
