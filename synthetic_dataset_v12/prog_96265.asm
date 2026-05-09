; DESCRIPTION: Renders a black box of size 104x14 starting at (393, 0).
; PLAN: r0=393(x), r1=0(y), r2=104(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 0
LDI r2, 104
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
