; DESCRIPTION: Places a purple 68x113 rectangle at position (277, 4).
; PLAN: r0=277(x), r1=4(y), r2=68(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 4
LDI r2, 68
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
