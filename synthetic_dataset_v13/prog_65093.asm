; DESCRIPTION: Places a white line segment connecting (168, 134) to (169, 193).
; PLAN: r0=168(x1), r1=134(y1), r2=169(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 134
LDI r2, 169
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
