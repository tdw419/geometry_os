; DESCRIPTION: Places a purple 103x79 rectangle at position (362, 29).
; PLAN: r0=362(x), r1=29(y), r2=103(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 29
LDI r2, 103
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
