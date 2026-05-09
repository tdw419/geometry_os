; DESCRIPTION: Renders a red box of size 21x14 starting at (258, 47).
; PLAN: r0=258(x), r1=47(y), r2=21(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 47
LDI r2, 21
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
