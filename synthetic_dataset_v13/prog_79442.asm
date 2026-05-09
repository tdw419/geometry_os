; DESCRIPTION: Renders a red box of size 39x79 starting at (28, 77).
; PLAN: r0=28(x), r1=77(y), r2=39(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 77
LDI r2, 39
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
