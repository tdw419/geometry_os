; DESCRIPTION: Renders a orange box of size 17x12 starting at (450, 141).
; PLAN: r0=450(x), r1=141(y), r2=17(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 141
LDI r2, 17
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
