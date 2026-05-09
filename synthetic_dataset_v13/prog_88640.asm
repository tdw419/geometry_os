; DESCRIPTION: Places a blue 120x24 rectangle at position (7, 90).
; PLAN: r0=7(x), r1=90(y), r2=120(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 90
LDI r2, 120
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
