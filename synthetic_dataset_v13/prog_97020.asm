; DESCRIPTION: Places a white line segment connecting (485, 202) to (267, 208).
; PLAN: r0=485(x1), r1=202(y1), r2=267(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 202
LDI r2, 267
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
