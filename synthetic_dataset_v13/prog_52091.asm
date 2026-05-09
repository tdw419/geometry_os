; DESCRIPTION: Renders a orange box of size 19x27 starting at (320, 60).
; PLAN: r0=320(x), r1=60(y), r2=19(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 60
LDI r2, 19
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
