; DESCRIPTION: Renders a black box of size 33x12 starting at (104, 213).
; PLAN: r0=104(x), r1=213(y), r2=33(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 213
LDI r2, 33
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
