; DESCRIPTION: Places a purple 28x18 rectangle at position (108, 126).
; PLAN: r0=108(x), r1=126(y), r2=28(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 126
LDI r2, 28
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
