; DESCRIPTION: Renders a orange box of size 39x46 starting at (264, 112).
; PLAN: r0=264(x), r1=112(y), r2=39(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 112
LDI r2, 39
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
