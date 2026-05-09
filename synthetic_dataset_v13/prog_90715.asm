; DESCRIPTION: Renders a red box of size 38x37 starting at (31, 7).
; PLAN: r0=31(x), r1=7(y), r2=38(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 7
LDI r2, 38
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
