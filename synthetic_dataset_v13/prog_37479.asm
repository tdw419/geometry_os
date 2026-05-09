; DESCRIPTION: Renders a red box of size 14x26 starting at (112, 195).
; PLAN: r0=112(x), r1=195(y), r2=14(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 195
LDI r2, 14
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
