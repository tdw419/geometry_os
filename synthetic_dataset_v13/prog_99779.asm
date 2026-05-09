; DESCRIPTION: Places a red line segment connecting (103, 214) to (285, 38).
; PLAN: r0=103(x1), r1=214(y1), r2=285(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 214
LDI r2, 285
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
