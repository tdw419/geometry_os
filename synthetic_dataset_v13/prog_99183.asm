; DESCRIPTION: Renders a orange box of size 63x54 starting at (274, 47).
; PLAN: r0=274(x), r1=47(y), r2=63(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 47
LDI r2, 63
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
