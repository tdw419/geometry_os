; DESCRIPTION: Draws a magenta line from (446, 65) to (511, 13).
; PLAN: r0=446(x1), r1=65(y1), r2=511(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 65
LDI r2, 511
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
