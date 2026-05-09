; DESCRIPTION: Renders a cyan box of size 74x52 starting at (217, 19).
; PLAN: r0=217(x), r1=19(y), r2=74(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 19
LDI r2, 74
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
