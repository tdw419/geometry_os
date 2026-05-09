; DESCRIPTION: Renders a black box of size 31x104 starting at (297, 24).
; PLAN: r0=297(x), r1=24(y), r2=31(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 24
LDI r2, 31
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
