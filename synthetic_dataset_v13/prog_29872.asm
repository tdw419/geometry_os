; DESCRIPTION: Places a purple 120x21 rectangle at position (309, 114).
; PLAN: r0=309(x), r1=114(y), r2=120(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 114
LDI r2, 120
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
