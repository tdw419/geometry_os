; DESCRIPTION: Renders a black box of size 112x18 starting at (165, 117).
; PLAN: r0=165(x), r1=117(y), r2=112(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 117
LDI r2, 112
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
