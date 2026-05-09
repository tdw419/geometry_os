; DESCRIPTION: Places a white 65x70 rectangle at position (426, 42).
; PLAN: r0=426(x), r1=42(y), r2=65(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 42
LDI r2, 65
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
