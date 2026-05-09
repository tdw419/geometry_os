; DESCRIPTION: Renders a black box of size 27x85 starting at (375, 70).
; PLAN: r0=375(x), r1=70(y), r2=27(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 70
LDI r2, 27
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
