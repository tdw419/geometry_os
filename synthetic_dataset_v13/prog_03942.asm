; DESCRIPTION: Places a purple 98x28 rectangle at position (141, 65).
; PLAN: r0=141(x), r1=65(y), r2=98(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 65
LDI r2, 98
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
