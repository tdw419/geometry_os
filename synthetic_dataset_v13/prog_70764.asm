; DESCRIPTION: Renders a orange box of size 74x120 starting at (113, 134).
; PLAN: r0=113(x), r1=134(y), r2=74(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 134
LDI r2, 74
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
