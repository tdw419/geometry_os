; DESCRIPTION: Places a white 17x114 rectangle at position (298, 137).
; PLAN: r0=298(x), r1=137(y), r2=17(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 137
LDI r2, 17
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
