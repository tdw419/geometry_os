; DESCRIPTION: Renders a purple box of size 67x25 starting at (442, 21).
; PLAN: r0=442(x), r1=21(y), r2=67(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 21
LDI r2, 67
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
