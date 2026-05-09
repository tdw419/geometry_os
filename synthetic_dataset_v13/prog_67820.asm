; DESCRIPTION: Places a green 105x25 rectangle at position (364, 125).
; PLAN: r0=364(x), r1=125(y), r2=105(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 125
LDI r2, 105
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
