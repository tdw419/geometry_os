; DESCRIPTION: Places a blue 96x64 rectangle at position (191, 102).
; PLAN: r0=191(x), r1=102(y), r2=96(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 102
LDI r2, 96
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
