; DESCRIPTION: Renders a purple box of size 81x93 starting at (255, 143).
; PLAN: r0=255(x), r1=143(y), r2=81(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 143
LDI r2, 81
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
