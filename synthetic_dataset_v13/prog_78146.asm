; DESCRIPTION: Places a blue 71x48 rectangle at position (236, 49).
; PLAN: r0=236(x), r1=49(y), r2=71(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 49
LDI r2, 71
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
