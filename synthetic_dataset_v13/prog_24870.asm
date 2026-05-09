; DESCRIPTION: Renders a black box of size 55x50 starting at (334, 60).
; PLAN: r0=334(x), r1=60(y), r2=55(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 60
LDI r2, 55
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
