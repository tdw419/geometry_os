; DESCRIPTION: Renders a orange box of size 102x54 starting at (248, 9).
; PLAN: r0=248(x), r1=9(y), r2=102(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 9
LDI r2, 102
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
