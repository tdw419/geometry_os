; DESCRIPTION: Renders a red box of size 36x32 starting at (19, 176).
; PLAN: r0=19(x), r1=176(y), r2=36(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 176
LDI r2, 36
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
