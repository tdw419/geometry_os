; DESCRIPTION: Places a green line segment connecting (450, 138) to (31, 174).
; PLAN: r0=450(x1), r1=138(y1), r2=31(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 138
LDI r2, 31
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
