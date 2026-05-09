; DESCRIPTION: Places a blue 59x46 rectangle at position (72, 195).
; PLAN: r0=72(x), r1=195(y), r2=59(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 195
LDI r2, 59
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
