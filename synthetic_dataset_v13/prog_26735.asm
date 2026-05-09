; DESCRIPTION: Renders a black box of size 50x16 starting at (338, 6).
; PLAN: r0=338(x), r1=6(y), r2=50(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 6
LDI r2, 50
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
