; DESCRIPTION: Renders a white box of size 77x117 starting at (36, 131).
; PLAN: r0=36(x), r1=131(y), r2=77(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 131
LDI r2, 77
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
