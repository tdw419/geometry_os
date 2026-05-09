; DESCRIPTION: Renders a orange box of size 87x112 starting at (275, 138).
; PLAN: r0=275(x), r1=138(y), r2=87(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 138
LDI r2, 87
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
