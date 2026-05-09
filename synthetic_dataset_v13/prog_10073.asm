; DESCRIPTION: Renders a purple box of size 70x19 starting at (228, 7).
; PLAN: r0=228(x), r1=7(y), r2=70(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 7
LDI r2, 70
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
