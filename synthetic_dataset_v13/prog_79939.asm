; DESCRIPTION: Renders a black box of size 76x10 starting at (154, 172).
; PLAN: r0=154(x), r1=172(y), r2=76(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 172
LDI r2, 76
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
