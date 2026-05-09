; DESCRIPTION: Renders a black box of size 55x95 starting at (442, 12).
; PLAN: r0=442(x), r1=12(y), r2=55(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 12
LDI r2, 55
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
