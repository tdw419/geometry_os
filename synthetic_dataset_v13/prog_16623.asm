; DESCRIPTION: Renders a purple box of size 67x36 starting at (21, 214).
; PLAN: r0=21(x), r1=214(y), r2=67(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 214
LDI r2, 67
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
