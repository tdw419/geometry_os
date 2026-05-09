; DESCRIPTION: Places a red 26x102 rectangle at position (150, 138).
; PLAN: r0=150(x), r1=138(y), r2=26(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 138
LDI r2, 26
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
