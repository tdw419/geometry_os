; DESCRIPTION: Renders a black box of size 100x116 starting at (98, 117).
; PLAN: r0=98(x), r1=117(y), r2=100(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 117
LDI r2, 100
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
