; DESCRIPTION: Renders a purple box of size 117x50 starting at (36, 125).
; PLAN: r0=36(x), r1=125(y), r2=117(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 125
LDI r2, 117
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
