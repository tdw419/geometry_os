; DESCRIPTION: Places a purple 37x61 rectangle at position (374, 188).
; PLAN: r0=374(x), r1=188(y), r2=37(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 188
LDI r2, 37
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
