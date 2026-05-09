; DESCRIPTION: Renders a orange box of size 17x34 starting at (277, 218).
; PLAN: r0=277(x), r1=218(y), r2=17(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 218
LDI r2, 17
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
