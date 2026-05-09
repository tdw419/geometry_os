; DESCRIPTION: Renders a black box of size 61x89 starting at (370, 80).
; PLAN: r0=370(x), r1=80(y), r2=61(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 80
LDI r2, 61
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
