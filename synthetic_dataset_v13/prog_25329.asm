; DESCRIPTION: Places a purple 36x28 rectangle at position (39, 165).
; PLAN: r0=39(x), r1=165(y), r2=36(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 165
LDI r2, 36
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
