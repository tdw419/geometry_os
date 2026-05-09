; DESCRIPTION: Renders a red box of size 86x34 starting at (106, 32).
; PLAN: r0=106(x), r1=32(y), r2=86(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 32
LDI r2, 86
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
