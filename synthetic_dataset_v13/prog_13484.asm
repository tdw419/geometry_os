; DESCRIPTION: Places a white 82x68 rectangle at position (13, 68).
; PLAN: r0=13(x), r1=68(y), r2=82(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 68
LDI r2, 82
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
