; DESCRIPTION: Renders a black box of size 86x104 starting at (95, 126).
; PLAN: r0=95(x), r1=126(y), r2=86(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 126
LDI r2, 86
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
