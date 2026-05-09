; DESCRIPTION: Places a green 73x96 rectangle at position (196, 102).
; PLAN: r0=196(x), r1=102(y), r2=73(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 102
LDI r2, 73
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
