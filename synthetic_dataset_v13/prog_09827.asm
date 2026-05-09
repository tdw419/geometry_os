; DESCRIPTION: Renders a red box of size 97x60 starting at (170, 120).
; PLAN: r0=170(x), r1=120(y), r2=97(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 120
LDI r2, 97
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
