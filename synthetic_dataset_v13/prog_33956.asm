; DESCRIPTION: Renders a magenta line between points (320, 168) and (44, 128).
; PLAN: r0=320(x1), r1=168(y1), r2=44(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 168
LDI r2, 44
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
