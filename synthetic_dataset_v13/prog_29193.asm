; DESCRIPTION: Renders a red box of size 76x117 starting at (300, 57).
; PLAN: r0=300(x), r1=57(y), r2=76(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 57
LDI r2, 76
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
