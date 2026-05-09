; DESCRIPTION: Places a black 85x120 rectangle at position (210, 64).
; PLAN: r0=210(x), r1=64(y), r2=85(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 64
LDI r2, 85
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
