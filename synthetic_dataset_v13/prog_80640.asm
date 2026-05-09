; DESCRIPTION: Renders a red box of size 21x28 starting at (437, 15).
; PLAN: r0=437(x), r1=15(y), r2=21(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 15
LDI r2, 21
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
