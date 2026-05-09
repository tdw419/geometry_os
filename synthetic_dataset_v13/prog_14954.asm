; DESCRIPTION: Places a white line segment connecting (207, 168) to (290, 210).
; PLAN: r0=207(x1), r1=168(y1), r2=290(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 168
LDI r2, 290
LDI r3, 210
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
