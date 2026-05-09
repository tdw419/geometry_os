; DESCRIPTION: Places a blue 72x105 rectangle at position (347, 117).
; PLAN: r0=347(x), r1=117(y), r2=72(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 117
LDI r2, 72
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
