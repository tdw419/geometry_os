; DESCRIPTION: Draws a magenta line from (103, 174) to (42, 250).
; PLAN: r0=103(x1), r1=174(y1), r2=42(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 174
LDI r2, 42
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
