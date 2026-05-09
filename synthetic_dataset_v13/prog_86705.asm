; DESCRIPTION: Places a white 112x110 rectangle at position (44, 20).
; PLAN: r0=44(x), r1=20(y), r2=112(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 20
LDI r2, 112
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
