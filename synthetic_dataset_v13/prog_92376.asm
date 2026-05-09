; DESCRIPTION: Places a purple 94x43 rectangle at position (191, 192).
; PLAN: r0=191(x), r1=192(y), r2=94(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 192
LDI r2, 94
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
