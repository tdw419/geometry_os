; DESCRIPTION: Renders a orange box of size 57x114 starting at (362, 34).
; PLAN: r0=362(x), r1=34(y), r2=57(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 34
LDI r2, 57
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
