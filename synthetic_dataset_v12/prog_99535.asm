; DESCRIPTION: Renders a green line between points (320, 112) and (338, 42).
; PLAN: r0=320(x1), r1=112(y1), r2=338(x2), r3=42(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 112
LDI r2, 338
LDI r3, 42
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
