; DESCRIPTION: Renders a orange box of size 14x27 starting at (442, 31).
; PLAN: r0=442(x), r1=31(y), r2=14(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 31
LDI r2, 14
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
