; DESCRIPTION: Places a white 75x73 rectangle at position (4, 65).
; PLAN: r0=4(x), r1=65(y), r2=75(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 65
LDI r2, 75
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
