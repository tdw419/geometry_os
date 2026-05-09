; DESCRIPTION: Renders a green box of size 43x39 starting at (103, 115).
; PLAN: r0=103(x), r1=115(y), r2=43(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 115
LDI r2, 43
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
