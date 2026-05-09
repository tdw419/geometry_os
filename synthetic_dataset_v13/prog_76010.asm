; DESCRIPTION: Renders a purple box of size 67x46 starting at (284, 52).
; PLAN: r0=284(x), r1=52(y), r2=67(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 52
LDI r2, 67
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
