; DESCRIPTION: Renders a black box of size 100x104 starting at (403, 132).
; PLAN: r0=403(x), r1=132(y), r2=100(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 132
LDI r2, 100
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
