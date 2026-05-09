; DESCRIPTION: Places a orange 113x40 rectangle at position (207, 69).
; PLAN: r0=207(x), r1=69(y), r2=113(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 69
LDI r2, 113
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
