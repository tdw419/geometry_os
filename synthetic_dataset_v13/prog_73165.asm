; DESCRIPTION: Renders a red box of size 63x98 starting at (18, 39).
; PLAN: r0=18(x), r1=39(y), r2=63(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 39
LDI r2, 63
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
