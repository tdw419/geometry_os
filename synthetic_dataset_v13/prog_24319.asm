; DESCRIPTION: Renders a red box of size 26x79 starting at (363, 7).
; PLAN: r0=363(x), r1=7(y), r2=26(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 7
LDI r2, 26
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
