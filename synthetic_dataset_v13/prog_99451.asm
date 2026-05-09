; DESCRIPTION: Renders a orange box of size 115x28 starting at (34, 192).
; PLAN: r0=34(x), r1=192(y), r2=115(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 192
LDI r2, 115
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
