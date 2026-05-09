; DESCRIPTION: Places a blue 83x73 rectangle at position (175, 57).
; PLAN: r0=175(x), r1=57(y), r2=83(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 57
LDI r2, 83
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
