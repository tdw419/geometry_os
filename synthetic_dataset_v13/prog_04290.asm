; DESCRIPTION: Places a purple 46x26 rectangle at position (408, 37).
; PLAN: r0=408(x), r1=37(y), r2=46(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 37
LDI r2, 46
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
