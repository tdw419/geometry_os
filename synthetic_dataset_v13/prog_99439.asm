; DESCRIPTION: Renders a blue box of size 37x26 starting at (284, 196).
; PLAN: r0=284(x), r1=196(y), r2=37(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 196
LDI r2, 37
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
