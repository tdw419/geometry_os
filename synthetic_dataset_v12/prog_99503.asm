; DESCRIPTION: Draws a magenta line from (50, 96) to (306, 6).
; PLAN: r0=50(x1), r1=96(y1), r2=306(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 96
LDI r2, 306
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
