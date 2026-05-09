; DESCRIPTION: Places a white 108x66 rectangle at position (186, 58).
; PLAN: r0=186(x), r1=58(y), r2=108(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 58
LDI r2, 108
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
