; DESCRIPTION: Renders a orange box of size 91x91 starting at (87, 60).
; PLAN: r0=87(x), r1=60(y), r2=91(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 60
LDI r2, 91
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
