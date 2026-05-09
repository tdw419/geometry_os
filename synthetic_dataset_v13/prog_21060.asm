; DESCRIPTION: Places a blue 16x113 rectangle at position (241, 135).
; PLAN: r0=241(x), r1=135(y), r2=16(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 135
LDI r2, 16
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
