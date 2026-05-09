; DESCRIPTION: Places a blue 67x98 rectangle at position (302, 130).
; PLAN: r0=302(x), r1=130(y), r2=67(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 130
LDI r2, 67
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
