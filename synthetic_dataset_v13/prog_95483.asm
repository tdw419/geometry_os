; DESCRIPTION: Places a cyan line segment connecting (284, 134) to (421, 1).
; PLAN: r0=284(x1), r1=134(y1), r2=421(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 134
LDI r2, 421
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
