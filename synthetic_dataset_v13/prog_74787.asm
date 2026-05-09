; DESCRIPTION: Places a red 106x67 rectangle at position (44, 9).
; PLAN: r0=44(x), r1=9(y), r2=106(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 9
LDI r2, 106
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
