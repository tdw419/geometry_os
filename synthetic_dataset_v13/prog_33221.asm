; DESCRIPTION: Places a black line segment connecting (384, 166) to (485, 28).
; PLAN: r0=384(x1), r1=166(y1), r2=485(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 166
LDI r2, 485
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
