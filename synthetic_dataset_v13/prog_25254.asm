; DESCRIPTION: Renders a orange box of size 25x53 starting at (275, 127).
; PLAN: r0=275(x), r1=127(y), r2=25(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 127
LDI r2, 25
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
