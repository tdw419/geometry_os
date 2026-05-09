; DESCRIPTION: Renders a red box of size 38x30 starting at (155, 57).
; PLAN: r0=155(x), r1=57(y), r2=38(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 57
LDI r2, 38
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
