; DESCRIPTION: Renders a orange box of size 57x68 starting at (287, 74).
; PLAN: r0=287(x), r1=74(y), r2=57(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 74
LDI r2, 57
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
