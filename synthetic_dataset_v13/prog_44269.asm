; DESCRIPTION: Renders a magenta line between points (493, 13) and (281, 157).
; PLAN: r0=493(x1), r1=13(y1), r2=281(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 13
LDI r2, 281
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
