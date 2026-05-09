; DESCRIPTION: Places a white circle of radius 80 at center (370, 117).
; PLAN: r0=370(x), r1=117(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 117
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
