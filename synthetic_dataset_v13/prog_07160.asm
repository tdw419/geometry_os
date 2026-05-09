; DESCRIPTION: Places a white 94x57 rectangle at position (388, 197).
; PLAN: r0=388(x), r1=197(y), r2=94(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 197
LDI r2, 94
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
