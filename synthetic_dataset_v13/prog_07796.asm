; DESCRIPTION: Renders a orange box of size 19x70 starting at (197, 54).
; PLAN: r0=197(x), r1=54(y), r2=19(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 54
LDI r2, 19
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
