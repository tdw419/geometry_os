; DESCRIPTION: Renders a orange box of size 31x36 starting at (438, 198).
; PLAN: r0=438(x), r1=198(y), r2=31(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 198
LDI r2, 31
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
