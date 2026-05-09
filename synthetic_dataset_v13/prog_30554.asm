; DESCRIPTION: Places a black 96x64 rectangle at position (22, 144).
; PLAN: r0=22(x), r1=144(y), r2=96(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 144
LDI r2, 96
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
