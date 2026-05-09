; DESCRIPTION: Renders a red box of size 114x77 starting at (278, 26).
; PLAN: r0=278(x), r1=26(y), r2=114(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 26
LDI r2, 114
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
