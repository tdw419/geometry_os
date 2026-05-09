; DESCRIPTION: Draws a blue line from (100, 69) to (264, 228).
; PLAN: r0=100(x1), r1=69(y1), r2=264(x2), r3=228(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 69
LDI r2, 264
LDI r3, 228
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
