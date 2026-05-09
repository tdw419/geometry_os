; DESCRIPTION: Renders a orange box of size 12x120 starting at (33, 134).
; PLAN: r0=33(x), r1=134(y), r2=12(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 134
LDI r2, 12
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
