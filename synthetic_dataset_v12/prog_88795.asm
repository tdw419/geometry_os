; DESCRIPTION: Renders a black box of size 83x95 starting at (237, 104).
; PLAN: r0=237(x), r1=104(y), r2=83(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 104
LDI r2, 83
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
