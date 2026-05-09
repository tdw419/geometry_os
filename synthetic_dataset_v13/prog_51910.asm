; DESCRIPTION: Places a blue 30x90 rectangle at position (437, 159).
; PLAN: r0=437(x), r1=159(y), r2=30(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 159
LDI r2, 30
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
