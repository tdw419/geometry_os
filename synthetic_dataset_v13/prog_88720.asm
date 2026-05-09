; DESCRIPTION: Renders a black box of size 45x104 starting at (370, 29).
; PLAN: r0=370(x), r1=29(y), r2=45(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 29
LDI r2, 45
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
