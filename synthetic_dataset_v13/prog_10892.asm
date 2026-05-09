; DESCRIPTION: Places a blue 21x73 rectangle at position (137, 171).
; PLAN: r0=137(x), r1=171(y), r2=21(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 171
LDI r2, 21
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
