; DESCRIPTION: Places a white 102x102 rectangle at position (250, 42).
; PLAN: r0=250(x), r1=42(y), r2=102(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 42
LDI r2, 102
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
