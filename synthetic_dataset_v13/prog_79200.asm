; DESCRIPTION: Renders a orange box of size 74x24 starting at (176, 202).
; PLAN: r0=176(x), r1=202(y), r2=74(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 202
LDI r2, 74
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
