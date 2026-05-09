; DESCRIPTION: Renders a red box of size 49x29 starting at (75, 213).
; PLAN: r0=75(x), r1=213(y), r2=49(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 213
LDI r2, 49
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
