; DESCRIPTION: Renders a black box of size 104x30 starting at (383, 104).
; PLAN: r0=383(x), r1=104(y), r2=104(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 104
LDI r2, 104
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
