; DESCRIPTION: Renders a orange box of size 33x21 starting at (451, 228).
; PLAN: r0=451(x), r1=228(y), r2=33(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 228
LDI r2, 33
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
