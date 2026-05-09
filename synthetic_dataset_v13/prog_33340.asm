; DESCRIPTION: Renders a orange box of size 39x58 starting at (358, 13).
; PLAN: r0=358(x), r1=13(y), r2=39(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 13
LDI r2, 39
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
