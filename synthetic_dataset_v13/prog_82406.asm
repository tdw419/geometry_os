; DESCRIPTION: Renders a red box of size 85x58 starting at (217, 195).
; PLAN: r0=217(x), r1=195(y), r2=85(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 195
LDI r2, 85
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
