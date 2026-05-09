; DESCRIPTION: Renders a red box of size 90x31 starting at (361, 52).
; PLAN: r0=361(x), r1=52(y), r2=90(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 52
LDI r2, 90
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
