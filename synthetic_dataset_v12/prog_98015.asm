; DESCRIPTION: Places a blue 19x92 rectangle at position (372, 125).
; PLAN: r0=372(x), r1=125(y), r2=19(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 125
LDI r2, 19
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
