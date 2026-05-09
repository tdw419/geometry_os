; DESCRIPTION: Places a purple 60x46 rectangle at position (255, 165).
; PLAN: r0=255(x), r1=165(y), r2=60(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 165
LDI r2, 60
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
