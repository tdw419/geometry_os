; DESCRIPTION: Places a white line segment connecting (19, 67) to (191, 27).
; PLAN: r0=19(x1), r1=67(y1), r2=191(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 67
LDI r2, 191
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
