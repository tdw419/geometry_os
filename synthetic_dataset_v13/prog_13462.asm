; DESCRIPTION: Places a red 110x11 rectangle at position (325, 55).
; PLAN: r0=325(x), r1=55(y), r2=110(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 55
LDI r2, 110
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
