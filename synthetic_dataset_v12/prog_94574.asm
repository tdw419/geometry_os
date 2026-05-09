; DESCRIPTION: Renders a purple box of size 94x117 starting at (209, 83).
; PLAN: r0=209(x), r1=83(y), r2=94(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 83
LDI r2, 94
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
