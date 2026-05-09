; DESCRIPTION: Places a black line segment connecting (267, 37) to (154, 180).
; PLAN: r0=267(x1), r1=37(y1), r2=154(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 37
LDI r2, 154
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
