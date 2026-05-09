; DESCRIPTION: Places a white 119x47 rectangle at position (392, 88).
; PLAN: r0=392(x), r1=88(y), r2=119(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 88
LDI r2, 119
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
