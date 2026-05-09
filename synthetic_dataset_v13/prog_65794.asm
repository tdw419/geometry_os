; DESCRIPTION: Places a blue 97x42 rectangle at position (177, 51).
; PLAN: r0=177(x), r1=51(y), r2=97(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 51
LDI r2, 97
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
