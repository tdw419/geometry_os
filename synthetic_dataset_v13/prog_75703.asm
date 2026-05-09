; DESCRIPTION: Places a blue line segment connecting (284, 67) to (254, 125).
; PLAN: r0=284(x1), r1=67(y1), r2=254(x2), r3=125(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 67
LDI r2, 254
LDI r3, 125
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
