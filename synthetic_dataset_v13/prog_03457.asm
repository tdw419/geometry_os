; DESCRIPTION: Places a yellow 67x109 rectangle at position (106, 114).
; PLAN: r0=106(x), r1=114(y), r2=67(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 114
LDI r2, 67
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
