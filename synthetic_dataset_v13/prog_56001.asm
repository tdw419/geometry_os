; DESCRIPTION: Renders a purple box of size 17x69 starting at (284, 38).
; PLAN: r0=284(x), r1=38(y), r2=17(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 38
LDI r2, 17
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
