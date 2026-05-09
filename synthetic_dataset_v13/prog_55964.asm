; DESCRIPTION: Places a green line segment connecting (284, 173) to (430, 3).
; PLAN: r0=284(x1), r1=173(y1), r2=430(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 173
LDI r2, 430
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
