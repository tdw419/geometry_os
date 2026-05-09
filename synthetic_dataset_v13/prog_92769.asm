; DESCRIPTION: Places a red line segment connecting (243, 196) to (267, 247).
; PLAN: r0=243(x1), r1=196(y1), r2=267(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 196
LDI r2, 267
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
