; DESCRIPTION: Draws a magenta line from (462, 123) to (295, 220).
; PLAN: r0=462(x1), r1=123(y1), r2=295(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 123
LDI r2, 295
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
