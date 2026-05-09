; DESCRIPTION: Renders a black box of size 100x87 starting at (410, 84).
; PLAN: r0=410(x), r1=84(y), r2=100(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 84
LDI r2, 100
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
