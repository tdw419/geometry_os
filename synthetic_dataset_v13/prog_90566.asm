; DESCRIPTION: Renders a orange box of size 29x34 starting at (335, 94).
; PLAN: r0=335(x), r1=94(y), r2=29(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 94
LDI r2, 29
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
