; DESCRIPTION: Places a white line segment connecting (327, 155) to (284, 37).
; PLAN: r0=327(x1), r1=155(y1), r2=284(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 155
LDI r2, 284
LDI r3, 37
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
