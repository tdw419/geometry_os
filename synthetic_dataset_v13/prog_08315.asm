; DESCRIPTION: Renders a magenta line between points (252, 255) and (356, 27).
; PLAN: r0=252(x1), r1=255(y1), r2=356(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 255
LDI r2, 356
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
