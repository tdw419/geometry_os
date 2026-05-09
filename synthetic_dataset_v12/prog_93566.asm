; DESCRIPTION: Renders a black box of size 50x48 starting at (86, 158).
; PLAN: r0=86(x), r1=158(y), r2=50(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 158
LDI r2, 50
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
