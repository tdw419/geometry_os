; DESCRIPTION: Renders a blue box of size 67x58 starting at (365, 86).
; PLAN: r0=365(x), r1=86(y), r2=67(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 86
LDI r2, 67
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
