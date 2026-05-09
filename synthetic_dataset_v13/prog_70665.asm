; DESCRIPTION: Renders a orange box of size 33x52 starting at (328, 140).
; PLAN: r0=328(x), r1=140(y), r2=33(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 140
LDI r2, 33
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
