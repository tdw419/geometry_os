; DESCRIPTION: Renders a green box of size 74x19 starting at (40, 19).
; PLAN: r0=40(x), r1=19(y), r2=74(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 19
LDI r2, 74
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
