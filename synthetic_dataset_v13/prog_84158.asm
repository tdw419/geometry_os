; DESCRIPTION: Places a red circle of radius 70 at center (151, 117).
; PLAN: r0=151(x), r1=117(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 117
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
