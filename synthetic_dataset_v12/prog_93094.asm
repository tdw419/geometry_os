; DESCRIPTION: Places a green 105x81 rectangle at position (228, 142).
; PLAN: r0=228(x), r1=142(y), r2=105(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 142
LDI r2, 105
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
