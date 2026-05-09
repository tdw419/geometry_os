; DESCRIPTION: Renders a cyan box of size 119x104 starting at (358, 88).
; PLAN: r0=358(x), r1=88(y), r2=119(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 88
LDI r2, 119
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
