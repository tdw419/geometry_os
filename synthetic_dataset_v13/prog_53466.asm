; DESCRIPTION: Places a red 80x107 rectangle at position (39, 69).
; PLAN: r0=39(x), r1=69(y), r2=80(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 69
LDI r2, 80
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
