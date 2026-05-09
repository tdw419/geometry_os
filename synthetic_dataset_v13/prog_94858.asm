; DESCRIPTION: Places a black line segment connecting (256, 33) to (284, 170).
; PLAN: r0=256(x1), r1=33(y1), r2=284(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 33
LDI r2, 284
LDI r3, 170
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
