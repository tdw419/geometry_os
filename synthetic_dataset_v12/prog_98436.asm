; DESCRIPTION: Renders a yellow line between points (320, 16) and (500, 42).
; PLAN: r0=320(x1), r1=16(y1), r2=500(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 16
LDI r2, 500
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
