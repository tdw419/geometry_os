; DESCRIPTION: Renders a orange box of size 47x120 starting at (264, 88).
; PLAN: r0=264(x), r1=88(y), r2=47(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 88
LDI r2, 47
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
