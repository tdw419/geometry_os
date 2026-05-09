; DESCRIPTION: Places a white 71x55 rectangle at position (94, 178).
; PLAN: r0=94(x), r1=178(y), r2=71(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 178
LDI r2, 71
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
