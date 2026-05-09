; DESCRIPTION: Places a white 24x108 rectangle at position (336, 6).
; PLAN: r0=336(x), r1=6(y), r2=24(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 6
LDI r2, 24
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
