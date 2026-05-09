; DESCRIPTION: Places a yellow 115x34 rectangle at position (373, 69).
; PLAN: r0=373(x), r1=69(y), r2=115(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 69
LDI r2, 115
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
