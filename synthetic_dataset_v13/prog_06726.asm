; DESCRIPTION: Renders a red box of size 100x48 starting at (7, 127).
; PLAN: r0=7(x), r1=127(y), r2=100(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 127
LDI r2, 100
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
