; DESCRIPTION: Places a red line segment connecting (215, 131) to (440, 89).
; PLAN: r0=215(x1), r1=131(y1), r2=440(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 131
LDI r2, 440
LDI r3, 89
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
