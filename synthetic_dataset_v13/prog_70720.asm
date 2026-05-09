; DESCRIPTION: Renders a orange box of size 53x46 starting at (187, 94).
; PLAN: r0=187(x), r1=94(y), r2=53(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 94
LDI r2, 53
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
