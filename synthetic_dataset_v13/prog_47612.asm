; DESCRIPTION: Places a black 101x32 rectangle at position (135, 125).
; PLAN: r0=135(x), r1=125(y), r2=101(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 125
LDI r2, 101
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
