; DESCRIPTION: Renders a green box of size 30x25 starting at (286, 67).
; PLAN: r0=286(x), r1=67(y), r2=30(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 67
LDI r2, 30
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
