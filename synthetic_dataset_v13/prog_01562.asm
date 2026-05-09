; DESCRIPTION: Places a purple 16x27 rectangle at position (120, 96).
; PLAN: r0=120(x), r1=96(y), r2=16(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 96
LDI r2, 16
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
