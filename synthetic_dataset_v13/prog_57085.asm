; DESCRIPTION: Places a white 107x45 rectangle at position (15, 80).
; PLAN: r0=15(x), r1=80(y), r2=107(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 80
LDI r2, 107
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
