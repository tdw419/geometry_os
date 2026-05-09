; DESCRIPTION: Places a white 64x95 rectangle at position (147, 84).
; PLAN: r0=147(x), r1=84(y), r2=64(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 84
LDI r2, 64
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
