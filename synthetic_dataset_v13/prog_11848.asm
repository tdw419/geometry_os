; DESCRIPTION: Renders a orange box of size 63x28 starting at (202, 114).
; PLAN: r0=202(x), r1=114(y), r2=63(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 114
LDI r2, 63
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
