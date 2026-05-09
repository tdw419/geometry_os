; DESCRIPTION: Places a blue 61x107 rectangle at position (395, 4).
; PLAN: r0=395(x), r1=4(y), r2=61(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 4
LDI r2, 61
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
