; DESCRIPTION: Renders a orange box of size 60x46 starting at (386, 52).
; PLAN: r0=386(x), r1=52(y), r2=60(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 52
LDI r2, 60
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
