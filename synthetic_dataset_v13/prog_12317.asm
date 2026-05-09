; DESCRIPTION: Places a blue 36x116 rectangle at position (96, 121).
; PLAN: r0=96(x), r1=121(y), r2=36(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 121
LDI r2, 36
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
