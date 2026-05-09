; DESCRIPTION: Renders a purple box of size 117x30 starting at (288, 113).
; PLAN: r0=288(x), r1=113(y), r2=117(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 113
LDI r2, 117
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
