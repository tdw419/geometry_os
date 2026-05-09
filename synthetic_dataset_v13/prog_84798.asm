; DESCRIPTION: Places a white 21x58 rectangle at position (273, 135).
; PLAN: r0=273(x), r1=135(y), r2=21(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 135
LDI r2, 21
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
