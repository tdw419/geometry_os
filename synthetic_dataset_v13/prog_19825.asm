; DESCRIPTION: Places a purple 37x39 rectangle at position (346, 202).
; PLAN: r0=346(x), r1=202(y), r2=37(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 202
LDI r2, 37
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
