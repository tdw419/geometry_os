; DESCRIPTION: Draws a green line from (69, 116) to (48, 54).
; PLAN: r0=69(x1), r1=116(y1), r2=48(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 116
LDI r2, 48
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
