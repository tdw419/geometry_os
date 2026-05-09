; DESCRIPTION: Places a blue 59x35 rectangle at position (357, 125).
; PLAN: r0=357(x), r1=125(y), r2=59(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 125
LDI r2, 59
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
