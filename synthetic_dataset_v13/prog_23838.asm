; DESCRIPTION: Renders a magenta line between points (229, 70) and (432, 213).
; PLAN: r0=229(x1), r1=70(y1), r2=432(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 70
LDI r2, 432
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
