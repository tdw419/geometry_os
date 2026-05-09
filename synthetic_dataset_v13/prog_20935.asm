; DESCRIPTION: Renders a purple box of size 118x44 starting at (284, 125).
; PLAN: r0=284(x), r1=125(y), r2=118(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 125
LDI r2, 118
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
