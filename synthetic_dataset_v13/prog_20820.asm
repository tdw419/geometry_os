; DESCRIPTION: Places a white 100x21 rectangle at position (192, 125).
; PLAN: r0=192(x), r1=125(y), r2=100(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 125
LDI r2, 100
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
