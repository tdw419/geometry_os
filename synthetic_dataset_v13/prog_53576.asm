; DESCRIPTION: Places a purple 56x90 rectangle at position (284, 105).
; PLAN: r0=284(x), r1=105(y), r2=56(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 105
LDI r2, 56
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
