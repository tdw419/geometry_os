; DESCRIPTION: Places a purple 98x19 rectangle at position (362, 113).
; PLAN: r0=362(x), r1=113(y), r2=98(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 113
LDI r2, 98
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
