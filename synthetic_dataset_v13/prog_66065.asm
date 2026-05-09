; DESCRIPTION: Places a purple line segment connecting (63, 42) to (465, 146).
; PLAN: r0=63(x1), r1=42(y1), r2=465(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 42
LDI r2, 465
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
