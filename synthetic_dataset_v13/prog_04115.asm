; DESCRIPTION: Renders a orange box of size 94x23 starting at (271, 68).
; PLAN: r0=271(x), r1=68(y), r2=94(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 68
LDI r2, 94
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
