; DESCRIPTION: Renders a black box of size 71x49 starting at (229, 19).
; PLAN: r0=229(x), r1=19(y), r2=71(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 19
LDI r2, 71
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
