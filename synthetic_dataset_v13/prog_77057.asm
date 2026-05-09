; DESCRIPTION: Renders a magenta line between points (207, 164) and (36, 231).
; PLAN: r0=207(x1), r1=164(y1), r2=36(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 164
LDI r2, 36
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
