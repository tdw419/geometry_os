; DESCRIPTION: Places a black line segment connecting (16, 247) to (215, 92).
; PLAN: r0=16(x1), r1=247(y1), r2=215(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 247
LDI r2, 215
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
