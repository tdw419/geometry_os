; DESCRIPTION: Places a white 15x55 rectangle at position (172, 20).
; PLAN: r0=172(x), r1=20(y), r2=15(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 20
LDI r2, 15
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
