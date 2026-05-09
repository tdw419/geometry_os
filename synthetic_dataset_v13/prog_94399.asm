; DESCRIPTION: Places a white line segment connecting (206, 148) to (197, 1).
; PLAN: r0=206(x1), r1=148(y1), r2=197(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 148
LDI r2, 197
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
