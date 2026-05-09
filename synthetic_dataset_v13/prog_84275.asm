; DESCRIPTION: Renders a purple box of size 11x115 starting at (281, 57).
; PLAN: r0=281(x), r1=57(y), r2=11(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 57
LDI r2, 11
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
