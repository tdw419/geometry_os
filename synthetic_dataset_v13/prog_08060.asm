; DESCRIPTION: Renders a orange box of size 115x14 starting at (187, 66).
; PLAN: r0=187(x), r1=66(y), r2=115(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 66
LDI r2, 115
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
