; DESCRIPTION: Places a blue 94x112 rectangle at position (333, 126).
; PLAN: r0=333(x), r1=126(y), r2=94(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 126
LDI r2, 94
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
