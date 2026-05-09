; DESCRIPTION: Draws a blue line from (462, 187) to (464, 154).
; PLAN: r0=462(x1), r1=187(y1), r2=464(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 187
LDI r2, 464
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
