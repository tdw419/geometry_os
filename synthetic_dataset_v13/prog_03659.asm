; DESCRIPTION: Places a white 40x17 rectangle at position (298, 106).
; PLAN: r0=298(x), r1=106(y), r2=40(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 106
LDI r2, 40
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
