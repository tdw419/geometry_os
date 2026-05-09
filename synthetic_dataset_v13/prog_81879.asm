; DESCRIPTION: Renders a purple box of size 107x24 starting at (346, 87).
; PLAN: r0=346(x), r1=87(y), r2=107(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 87
LDI r2, 107
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
