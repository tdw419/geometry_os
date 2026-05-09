; DESCRIPTION: Places a white 75x84 rectangle at position (237, 138).
; PLAN: r0=237(x), r1=138(y), r2=75(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 138
LDI r2, 75
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
