; DESCRIPTION: Places a purple 84x11 rectangle at position (202, 125).
; PLAN: r0=202(x), r1=125(y), r2=84(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 125
LDI r2, 84
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
