; DESCRIPTION: Places a purple 30x56 rectangle at position (284, 172).
; PLAN: r0=284(x), r1=172(y), r2=30(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 172
LDI r2, 30
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
