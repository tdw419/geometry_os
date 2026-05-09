; DESCRIPTION: Renders a black box of size 50x23 starting at (293, 2).
; PLAN: r0=293(x), r1=2(y), r2=50(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 2
LDI r2, 50
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
