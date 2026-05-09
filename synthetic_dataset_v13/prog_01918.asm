; DESCRIPTION: Places a yellow 103x32 rectangle at position (55, 64).
; PLAN: r0=55(x), r1=64(y), r2=103(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 64
LDI r2, 103
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
