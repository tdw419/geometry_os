; DESCRIPTION: Renders a orange box of size 73x82 starting at (428, 16).
; PLAN: r0=428(x), r1=16(y), r2=73(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 16
LDI r2, 73
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
