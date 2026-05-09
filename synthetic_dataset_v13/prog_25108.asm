; DESCRIPTION: Renders a orange box of size 12x94 starting at (356, 38).
; PLAN: r0=356(x), r1=38(y), r2=12(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 38
LDI r2, 12
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
