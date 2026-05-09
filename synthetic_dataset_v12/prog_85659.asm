; DESCRIPTION: Places a white line segment connecting (410, 67) to (32, 135).
; PLAN: r0=410(x1), r1=67(y1), r2=32(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 67
LDI r2, 32
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
