; DESCRIPTION: Places a red line segment connecting (380, 55) to (387, 207).
; PLAN: r0=380(x1), r1=55(y1), r2=387(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 55
LDI r2, 387
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
