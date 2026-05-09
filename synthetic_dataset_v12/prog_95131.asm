; DESCRIPTION: Places a white 108x21 rectangle at position (199, 149).
; PLAN: r0=199(x), r1=149(y), r2=108(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 149
LDI r2, 108
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
