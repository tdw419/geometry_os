; DESCRIPTION: Places a blue 48x64 rectangle at position (217, 35).
; PLAN: r0=217(x), r1=35(y), r2=48(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 35
LDI r2, 48
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
