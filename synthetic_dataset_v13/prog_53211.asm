; DESCRIPTION: Draws a magenta line from (393, 95) to (392, 86).
; PLAN: r0=393(x1), r1=95(y1), r2=392(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 95
LDI r2, 392
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
