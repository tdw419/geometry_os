; DESCRIPTION: Places a purple 10x52 rectangle at position (263, 28).
; PLAN: r0=263(x), r1=28(y), r2=10(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 28
LDI r2, 10
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
