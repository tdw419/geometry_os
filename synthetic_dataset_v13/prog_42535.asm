; DESCRIPTION: Places a blue 24x59 rectangle at position (187, 35).
; PLAN: r0=187(x), r1=35(y), r2=24(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 35
LDI r2, 24
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
