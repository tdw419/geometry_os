; DESCRIPTION: Renders a red box of size 89x103 starting at (44, 39).
; PLAN: r0=44(x), r1=39(y), r2=89(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 39
LDI r2, 89
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
