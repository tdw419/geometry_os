; DESCRIPTION: Places a blue 94x59 rectangle at position (327, 55).
; PLAN: r0=327(x), r1=55(y), r2=94(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 55
LDI r2, 94
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
