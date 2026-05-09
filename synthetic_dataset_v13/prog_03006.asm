; DESCRIPTION: Renders a purple box of size 113x102 starting at (87, 44).
; PLAN: r0=87(x), r1=44(y), r2=113(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 44
LDI r2, 113
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
