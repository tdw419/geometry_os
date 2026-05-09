; DESCRIPTION: Renders a purple box of size 93x56 starting at (164, 186).
; PLAN: r0=164(x), r1=186(y), r2=93(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 186
LDI r2, 93
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
