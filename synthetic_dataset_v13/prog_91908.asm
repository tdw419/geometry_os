; DESCRIPTION: Renders a black box of size 112x104 starting at (207, 50).
; PLAN: r0=207(x), r1=50(y), r2=112(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 50
LDI r2, 112
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
