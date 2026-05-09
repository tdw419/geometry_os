; DESCRIPTION: Places a black line segment connecting (215, 153) to (103, 214).
; PLAN: r0=215(x1), r1=153(y1), r2=103(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 153
LDI r2, 103
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
