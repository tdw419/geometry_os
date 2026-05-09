; DESCRIPTION: Renders a orange box of size 53x27 starting at (196, 4).
; PLAN: r0=196(x), r1=4(y), r2=53(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 4
LDI r2, 53
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
