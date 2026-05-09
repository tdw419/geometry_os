; DESCRIPTION: Places a blue 29x66 rectangle at position (25, 190).
; PLAN: r0=25(x), r1=190(y), r2=29(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 190
LDI r2, 29
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
