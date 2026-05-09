; DESCRIPTION: Draws a magenta line from (38, 115) to (450, 83).
; PLAN: r0=38(x1), r1=115(y1), r2=450(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 115
LDI r2, 450
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
