; DESCRIPTION: Renders a red box of size 43x45 starting at (437, 12).
; PLAN: r0=437(x), r1=12(y), r2=43(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 12
LDI r2, 43
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
