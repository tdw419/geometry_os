; DESCRIPTION: Places a red line segment connecting (284, 141) to (23, 163).
; PLAN: r0=284(x1), r1=141(y1), r2=23(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 141
LDI r2, 23
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
