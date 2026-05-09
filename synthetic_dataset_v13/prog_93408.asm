; DESCRIPTION: Renders a purple box of size 104x120 starting at (170, 113).
; PLAN: r0=170(x), r1=113(y), r2=104(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 113
LDI r2, 104
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
