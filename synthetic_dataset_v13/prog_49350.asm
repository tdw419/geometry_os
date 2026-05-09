; DESCRIPTION: Renders a orange box of size 54x49 starting at (274, 187).
; PLAN: r0=274(x), r1=187(y), r2=54(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 187
LDI r2, 54
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
