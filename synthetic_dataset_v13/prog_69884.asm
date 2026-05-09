; DESCRIPTION: Places a blue line segment connecting (284, 91) to (303, 177).
; PLAN: r0=284(x1), r1=91(y1), r2=303(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 91
LDI r2, 303
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
