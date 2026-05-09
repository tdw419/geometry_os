; DESCRIPTION: Renders a red box of size 97x34 starting at (372, 40).
; PLAN: r0=372(x), r1=40(y), r2=97(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 40
LDI r2, 97
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
