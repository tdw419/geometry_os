; DESCRIPTION: Renders a orange box of size 14x59 starting at (231, 195).
; PLAN: r0=231(x), r1=195(y), r2=14(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 195
LDI r2, 14
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
