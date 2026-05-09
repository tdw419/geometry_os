; DESCRIPTION: Renders a red box of size 21x36 starting at (86, 80).
; PLAN: r0=86(x), r1=80(y), r2=21(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 80
LDI r2, 21
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
