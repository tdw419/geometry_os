; DESCRIPTION: Places a magenta 39x107 rectangle at position (313, 130).
; PLAN: r0=313(x), r1=130(y), r2=39(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 130
LDI r2, 39
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
