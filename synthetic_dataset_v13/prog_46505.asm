; DESCRIPTION: Draws a green line from (168, 103) to (140, 69).
; PLAN: r0=168(x1), r1=103(y1), r2=140(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 103
LDI r2, 140
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
