; DESCRIPTION: Renders a red box of size 118x27 starting at (300, 18).
; PLAN: r0=300(x), r1=18(y), r2=118(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 18
LDI r2, 118
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
