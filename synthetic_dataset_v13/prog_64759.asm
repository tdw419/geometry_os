; DESCRIPTION: Places a white line segment connecting (284, 196) to (59, 90).
; PLAN: r0=284(x1), r1=196(y1), r2=59(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 196
LDI r2, 59
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
