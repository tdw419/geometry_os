; DESCRIPTION: Places a green 95x81 rectangle at position (412, 96).
; PLAN: r0=412(x), r1=96(y), r2=95(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 96
LDI r2, 95
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
