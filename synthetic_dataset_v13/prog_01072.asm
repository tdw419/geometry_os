; DESCRIPTION: Renders a purple box of size 58x90 starting at (153, 107).
; PLAN: r0=153(x), r1=107(y), r2=58(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 107
LDI r2, 58
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
