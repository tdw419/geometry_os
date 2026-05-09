; DESCRIPTION: Places a white 108x48 rectangle at position (249, 0).
; PLAN: r0=249(x), r1=0(y), r2=108(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 0
LDI r2, 108
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
