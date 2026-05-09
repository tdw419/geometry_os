; DESCRIPTION: Draws a magenta line from (87, 44) to (100, 242).
; PLAN: r0=87(x1), r1=44(y1), r2=100(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 44
LDI r2, 100
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
