; DESCRIPTION: Places a purple 120x77 rectangle at position (195, 42).
; PLAN: r0=195(x), r1=42(y), r2=120(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 42
LDI r2, 120
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
