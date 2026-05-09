; DESCRIPTION: Places a yellow line segment connecting (284, 54) to (446, 191).
; PLAN: r0=284(x1), r1=54(y1), r2=446(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 54
LDI r2, 446
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
