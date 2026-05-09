; DESCRIPTION: Places a green 68x64 rectangle at position (132, 72).
; PLAN: r0=132(x), r1=72(y), r2=68(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 72
LDI r2, 68
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
