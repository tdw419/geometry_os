; DESCRIPTION: Places a green 87x61 rectangle at position (76, 125).
; PLAN: r0=76(x), r1=125(y), r2=87(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 125
LDI r2, 87
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
