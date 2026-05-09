; DESCRIPTION: Places a white 65x103 rectangle at position (37, 82).
; PLAN: r0=37(x), r1=82(y), r2=65(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 82
LDI r2, 65
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
