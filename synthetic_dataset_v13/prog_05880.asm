; DESCRIPTION: Renders a magenta line between points (263, 249) and (450, 127).
; PLAN: r0=263(x1), r1=249(y1), r2=450(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 249
LDI r2, 450
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
