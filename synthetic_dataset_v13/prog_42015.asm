; DESCRIPTION: Renders a red box of size 44x65 starting at (2, 90).
; PLAN: r0=2(x), r1=90(y), r2=44(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 90
LDI r2, 44
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
