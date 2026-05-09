; DESCRIPTION: Renders a magenta line between points (16, 172) and (492, 249).
; PLAN: r0=16(x1), r1=172(y1), r2=492(x2), r3=249(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 172
LDI r2, 492
LDI r3, 249
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
