; DESCRIPTION: Places a white 43x110 rectangle at position (172, 65).
; PLAN: r0=172(x), r1=65(y), r2=43(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 65
LDI r2, 43
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
