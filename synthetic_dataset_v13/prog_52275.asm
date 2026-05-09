; DESCRIPTION: Places a red 114x100 rectangle at position (391, 100).
; PLAN: r0=391(x), r1=100(y), r2=114(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 100
LDI r2, 114
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
