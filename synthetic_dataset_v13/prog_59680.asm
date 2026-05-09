; DESCRIPTION: Places a white 115x79 rectangle at position (48, 83).
; PLAN: r0=48(x), r1=83(y), r2=115(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 83
LDI r2, 115
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
