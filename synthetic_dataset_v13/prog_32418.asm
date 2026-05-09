; DESCRIPTION: Renders a red box of size 94x11 starting at (10, 172).
; PLAN: r0=10(x), r1=172(y), r2=94(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 172
LDI r2, 94
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
