; DESCRIPTION: Places a blue 120x26 rectangle at position (129, 11).
; PLAN: r0=129(x), r1=11(y), r2=120(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 11
LDI r2, 120
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
