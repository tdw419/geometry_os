; DESCRIPTION: Renders a green line between points (64, 68) and (288, 47).
; PLAN: r0=64(x1), r1=68(y1), r2=288(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 68
LDI r2, 288
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
