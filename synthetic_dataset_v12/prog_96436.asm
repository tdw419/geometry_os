; DESCRIPTION: Renders a red box of size 21x12 starting at (343, 168).
; PLAN: r0=343(x), r1=168(y), r2=21(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 168
LDI r2, 21
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
