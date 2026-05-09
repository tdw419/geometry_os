; DESCRIPTION: Renders a yellow box of size 15x114 starting at (71, 117).
; PLAN: r0=71(x), r1=117(y), r2=15(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 117
LDI r2, 15
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
