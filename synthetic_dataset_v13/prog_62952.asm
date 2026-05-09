; DESCRIPTION: Places a red 58x113 rectangle at position (205, 22).
; PLAN: r0=205(x), r1=22(y), r2=58(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 22
LDI r2, 58
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
