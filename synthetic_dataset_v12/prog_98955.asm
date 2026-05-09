; DESCRIPTION: Places a blue 120x79 rectangle at position (219, 117).
; PLAN: r0=219(x), r1=117(y), r2=120(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 117
LDI r2, 120
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
