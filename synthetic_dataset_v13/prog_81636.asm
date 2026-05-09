; DESCRIPTION: Renders a orange box of size 46x91 starting at (82, 131).
; PLAN: r0=82(x), r1=131(y), r2=46(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 131
LDI r2, 46
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
