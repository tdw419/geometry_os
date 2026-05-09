; DESCRIPTION: Places a purple 111x62 rectangle at position (126, 182).
; PLAN: r0=126(x), r1=182(y), r2=111(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 182
LDI r2, 111
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
