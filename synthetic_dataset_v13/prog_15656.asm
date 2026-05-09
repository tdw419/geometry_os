; DESCRIPTION: Renders a orange box of size 34x94 starting at (211, 142).
; PLAN: r0=211(x), r1=142(y), r2=34(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 142
LDI r2, 34
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
