; DESCRIPTION: Places a green line segment connecting (339, 78) to (284, 38).
; PLAN: r0=339(x1), r1=78(y1), r2=284(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 78
LDI r2, 284
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
