; DESCRIPTION: Places a white 103x45 rectangle at position (220, 11).
; PLAN: r0=220(x), r1=11(y), r2=103(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 11
LDI r2, 103
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
