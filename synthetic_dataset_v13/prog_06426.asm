; DESCRIPTION: Places a white 38x119 rectangle at position (17, 46).
; PLAN: r0=17(x), r1=46(y), r2=38(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 46
LDI r2, 38
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
