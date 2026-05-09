; DESCRIPTION: Renders a black box of size 79x27 starting at (217, 212).
; PLAN: r0=217(x), r1=212(y), r2=79(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 212
LDI r2, 79
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
