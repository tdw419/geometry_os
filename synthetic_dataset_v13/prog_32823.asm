; DESCRIPTION: Places a white line segment connecting (284, 59) to (294, 70).
; PLAN: r0=284(x1), r1=59(y1), r2=294(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 59
LDI r2, 294
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
