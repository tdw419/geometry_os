; DESCRIPTION: Places a white 82x23 rectangle at position (156, 102).
; PLAN: r0=156(x), r1=102(y), r2=82(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 102
LDI r2, 82
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
