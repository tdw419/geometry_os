; DESCRIPTION: Renders a red box of size 74x36 starting at (67, 213).
; PLAN: r0=67(x), r1=213(y), r2=74(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 213
LDI r2, 74
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
