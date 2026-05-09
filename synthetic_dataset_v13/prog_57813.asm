; DESCRIPTION: Places a black 75x96 rectangle at position (65, 153).
; PLAN: r0=65(x), r1=153(y), r2=75(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 153
LDI r2, 75
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
