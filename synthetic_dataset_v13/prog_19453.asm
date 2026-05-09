; DESCRIPTION: Places a blue 39x65 rectangle at position (96, 33).
; PLAN: r0=96(x), r1=33(y), r2=39(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 33
LDI r2, 39
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
