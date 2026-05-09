; DESCRIPTION: Places a white line segment connecting (455, 164) to (50, 71).
; PLAN: r0=455(x1), r1=164(y1), r2=50(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 164
LDI r2, 50
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
