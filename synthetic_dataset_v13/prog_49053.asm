; DESCRIPTION: Places a white 40x45 rectangle at position (467, 134).
; PLAN: r0=467(x), r1=134(y), r2=40(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 134
LDI r2, 40
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
