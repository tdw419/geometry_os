; DESCRIPTION: Places a red 32x112 rectangle at position (52, 84).
; PLAN: r0=52(x), r1=84(y), r2=32(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 84
LDI r2, 32
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
