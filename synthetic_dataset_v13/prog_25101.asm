; DESCRIPTION: Places a purple 84x25 rectangle at position (178, 209).
; PLAN: r0=178(x), r1=209(y), r2=84(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 209
LDI r2, 84
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
