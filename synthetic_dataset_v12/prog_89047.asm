; DESCRIPTION: Places a red 114x91 rectangle at position (91, 9).
; PLAN: r0=91(x), r1=9(y), r2=114(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 9
LDI r2, 114
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
