; DESCRIPTION: Renders a red box of size 18x26 starting at (428, 188).
; PLAN: r0=428(x), r1=188(y), r2=18(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 188
LDI r2, 18
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
