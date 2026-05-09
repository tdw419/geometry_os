; DESCRIPTION: Renders a red box of size 90x56 starting at (190, 84).
; PLAN: r0=190(x), r1=84(y), r2=90(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 84
LDI r2, 90
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
