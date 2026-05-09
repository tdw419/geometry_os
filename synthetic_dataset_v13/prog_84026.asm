; DESCRIPTION: Places a white 50x15 rectangle at position (431, 125).
; PLAN: r0=431(x), r1=125(y), r2=50(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 125
LDI r2, 50
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
