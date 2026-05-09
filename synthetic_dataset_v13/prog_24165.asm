; DESCRIPTION: Renders a magenta line between points (492, 61) and (196, 173).
; PLAN: r0=492(x1), r1=61(y1), r2=196(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 61
LDI r2, 196
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
