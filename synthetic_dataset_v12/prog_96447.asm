; DESCRIPTION: Places a blue 65x33 rectangle at position (382, 215).
; PLAN: r0=382(x), r1=215(y), r2=65(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 215
LDI r2, 65
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
