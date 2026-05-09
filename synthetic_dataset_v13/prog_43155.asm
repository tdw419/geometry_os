; DESCRIPTION: Places a red circle of radius 43 at center (94, 117).
; PLAN: r0=94(x), r1=117(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 117
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
