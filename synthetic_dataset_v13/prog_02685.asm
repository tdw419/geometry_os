; DESCRIPTION: Renders a red box of size 64x59 starting at (213, 52).
; PLAN: r0=213(x), r1=52(y), r2=64(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 52
LDI r2, 64
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
