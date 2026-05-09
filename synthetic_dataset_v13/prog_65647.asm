; DESCRIPTION: Renders a blue box of size 80x111 starting at (346, 126).
; PLAN: r0=346(x), r1=126(y), r2=80(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 126
LDI r2, 80
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
