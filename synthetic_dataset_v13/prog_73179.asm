; DESCRIPTION: Places a white 60x57 rectangle at position (80, 6).
; PLAN: r0=80(x), r1=6(y), r2=60(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 6
LDI r2, 60
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
