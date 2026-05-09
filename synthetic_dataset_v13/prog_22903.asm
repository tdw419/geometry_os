; DESCRIPTION: Renders a black box of size 105x45 starting at (264, 120).
; PLAN: r0=264(x), r1=120(y), r2=105(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 120
LDI r2, 105
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
