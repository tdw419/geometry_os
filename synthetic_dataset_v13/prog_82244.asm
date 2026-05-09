; DESCRIPTION: Places a purple 103x61 rectangle at position (173, 86).
; PLAN: r0=173(x), r1=86(y), r2=103(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 86
LDI r2, 103
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
