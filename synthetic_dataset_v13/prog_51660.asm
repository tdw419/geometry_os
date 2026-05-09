; DESCRIPTION: Renders a red box of size 52x46 starting at (428, 98).
; PLAN: r0=428(x), r1=98(y), r2=52(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 98
LDI r2, 52
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
