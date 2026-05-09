; DESCRIPTION: Places a blue 33x65 rectangle at position (460, 98).
; PLAN: r0=460(x), r1=98(y), r2=33(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 98
LDI r2, 33
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
