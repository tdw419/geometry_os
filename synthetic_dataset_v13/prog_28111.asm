; DESCRIPTION: Places a blue 38x57 rectangle at position (236, 44).
; PLAN: r0=236(x), r1=44(y), r2=38(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 44
LDI r2, 38
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
