; DESCRIPTION: Places a green line segment connecting (267, 238) to (226, 152).
; PLAN: r0=267(x1), r1=238(y1), r2=226(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 238
LDI r2, 226
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
