; DESCRIPTION: Renders a orange box of size 50x29 starting at (260, 217).
; PLAN: r0=260(x), r1=217(y), r2=50(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 217
LDI r2, 50
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
