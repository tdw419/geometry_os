; DESCRIPTION: Renders a magenta line between points (498, 24) and (320, 73).
; PLAN: r0=498(x1), r1=24(y1), r2=320(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 24
LDI r2, 320
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
