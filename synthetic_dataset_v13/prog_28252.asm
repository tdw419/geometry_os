; DESCRIPTION: Places a white 44x57 rectangle at position (178, 142).
; PLAN: r0=178(x), r1=142(y), r2=44(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 142
LDI r2, 44
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
