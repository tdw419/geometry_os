; DESCRIPTION: Renders a green box of size 108x27 starting at (19, 56).
; PLAN: r0=19(x), r1=56(y), r2=108(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 56
LDI r2, 108
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
