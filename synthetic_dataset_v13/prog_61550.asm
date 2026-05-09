; DESCRIPTION: Places a white 45x90 rectangle at position (94, 142).
; PLAN: r0=94(x), r1=142(y), r2=45(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 142
LDI r2, 45
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
