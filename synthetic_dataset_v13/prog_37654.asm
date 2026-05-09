; DESCRIPTION: Renders a red box of size 39x67 starting at (128, 6).
; PLAN: r0=128(x), r1=6(y), r2=39(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 6
LDI r2, 39
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
