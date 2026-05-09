; DESCRIPTION: Renders a blue box of size 80x30 starting at (284, 10).
; PLAN: r0=284(x), r1=10(y), r2=80(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 10
LDI r2, 80
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
