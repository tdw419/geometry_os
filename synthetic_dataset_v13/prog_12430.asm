; DESCRIPTION: Renders a orange box of size 115x61 starting at (386, 75).
; PLAN: r0=386(x), r1=75(y), r2=115(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 75
LDI r2, 115
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
