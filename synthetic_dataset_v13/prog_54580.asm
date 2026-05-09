; DESCRIPTION: Places a white 47x15 rectangle at position (63, 33).
; PLAN: r0=63(x), r1=33(y), r2=47(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 33
LDI r2, 47
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
