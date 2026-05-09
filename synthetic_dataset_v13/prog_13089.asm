; DESCRIPTION: Places a blue 27x66 rectangle at position (76, 125).
; PLAN: r0=76(x), r1=125(y), r2=27(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 125
LDI r2, 27
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
