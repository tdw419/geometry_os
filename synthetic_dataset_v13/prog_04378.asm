; DESCRIPTION: Renders a purple box of size 104x26 starting at (15, 107).
; PLAN: r0=15(x), r1=107(y), r2=104(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 107
LDI r2, 104
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
