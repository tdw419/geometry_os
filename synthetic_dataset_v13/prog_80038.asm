; DESCRIPTION: Renders a white box of size 115x19 starting at (127, 34).
; PLAN: r0=127(x), r1=34(y), r2=115(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 34
LDI r2, 115
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
