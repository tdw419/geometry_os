; DESCRIPTION: Places a purple 46x47 rectangle at position (405, 127).
; PLAN: r0=405(x), r1=127(y), r2=46(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 127
LDI r2, 46
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
