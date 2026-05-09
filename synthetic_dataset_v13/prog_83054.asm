; DESCRIPTION: Places a blue 93x96 rectangle at position (177, 129).
; PLAN: r0=177(x), r1=129(y), r2=93(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 129
LDI r2, 93
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
