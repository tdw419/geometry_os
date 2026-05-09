; DESCRIPTION: Places a green line segment connecting (386, 77) to (290, 152).
; PLAN: r0=386(x1), r1=77(y1), r2=290(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 77
LDI r2, 290
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
