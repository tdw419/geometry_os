; DESCRIPTION: Places a red line segment connecting (454, 221) to (387, 237).
; PLAN: r0=454(x1), r1=221(y1), r2=387(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 221
LDI r2, 387
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
