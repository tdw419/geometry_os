; DESCRIPTION: Renders a black box of size 75x39 starting at (247, 104).
; PLAN: r0=247(x), r1=104(y), r2=75(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 104
LDI r2, 75
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
