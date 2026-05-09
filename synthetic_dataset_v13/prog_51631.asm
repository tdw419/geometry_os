; DESCRIPTION: Renders a black box of size 112x119 starting at (154, 70).
; PLAN: r0=154(x), r1=70(y), r2=112(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 70
LDI r2, 112
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
