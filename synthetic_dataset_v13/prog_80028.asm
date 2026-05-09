; DESCRIPTION: Places a white 12x11 rectangle at position (17, 6).
; PLAN: r0=17(x), r1=6(y), r2=12(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 6
LDI r2, 12
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
