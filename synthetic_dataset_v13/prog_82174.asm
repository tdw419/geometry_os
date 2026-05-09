; DESCRIPTION: Places a purple 12x15 rectangle at position (294, 37).
; PLAN: r0=294(x), r1=37(y), r2=12(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 37
LDI r2, 12
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
