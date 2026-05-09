; DESCRIPTION: Renders a purple box of size 71x40 starting at (284, 11).
; PLAN: r0=284(x), r1=11(y), r2=71(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 11
LDI r2, 71
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
