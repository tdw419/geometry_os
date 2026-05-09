; DESCRIPTION: Places a green 106x32 rectangle at position (100, 138).
; PLAN: r0=100(x), r1=138(y), r2=106(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 138
LDI r2, 106
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
