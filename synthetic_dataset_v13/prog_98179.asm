; DESCRIPTION: Places a white 105x37 rectangle at position (298, 179).
; PLAN: r0=298(x), r1=179(y), r2=105(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 179
LDI r2, 105
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
