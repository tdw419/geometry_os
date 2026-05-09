; DESCRIPTION: Renders a orange box of size 107x32 starting at (395, 130).
; PLAN: r0=395(x), r1=130(y), r2=107(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 130
LDI r2, 107
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
