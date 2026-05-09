; DESCRIPTION: Renders a orange box of size 67x94 starting at (16, 34).
; PLAN: r0=16(x), r1=34(y), r2=67(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 34
LDI r2, 67
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
