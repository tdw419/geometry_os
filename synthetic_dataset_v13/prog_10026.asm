; DESCRIPTION: Places a blue 55x40 rectangle at position (221, 68).
; PLAN: r0=221(x), r1=68(y), r2=55(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 68
LDI r2, 55
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
