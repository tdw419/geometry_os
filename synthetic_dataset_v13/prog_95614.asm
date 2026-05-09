; DESCRIPTION: Renders a purple box of size 36x113 starting at (277, 5).
; PLAN: r0=277(x), r1=5(y), r2=36(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 5
LDI r2, 36
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
