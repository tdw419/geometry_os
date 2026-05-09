; DESCRIPTION: Places a cyan 101x116 rectangle at position (148, 110).
; PLAN: r0=148(x), r1=110(y), r2=101(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 110
LDI r2, 101
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
