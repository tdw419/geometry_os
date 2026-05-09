; DESCRIPTION: Renders a black box of size 28x75 starting at (214, 3).
; PLAN: r0=214(x), r1=3(y), r2=28(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 3
LDI r2, 28
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
