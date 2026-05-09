; DESCRIPTION: Places a green 105x29 rectangle at position (154, 132).
; PLAN: r0=154(x), r1=132(y), r2=105(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 132
LDI r2, 105
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
