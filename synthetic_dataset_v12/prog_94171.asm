; DESCRIPTION: Places a blue 79x33 rectangle at position (328, 17).
; PLAN: r0=328(x), r1=17(y), r2=79(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 17
LDI r2, 79
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
