; DESCRIPTION: Places a blue 55x61 rectangle at position (2, 65).
; PLAN: r0=2(x), r1=65(y), r2=55(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 65
LDI r2, 55
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
