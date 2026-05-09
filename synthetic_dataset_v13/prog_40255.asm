; DESCRIPTION: Renders a black box of size 42x19 starting at (1, 117).
; PLAN: r0=1(x), r1=117(y), r2=42(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 117
LDI r2, 42
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
