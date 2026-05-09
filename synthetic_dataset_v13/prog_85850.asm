; DESCRIPTION: Places a red 75x31 rectangle at position (120, 189).
; PLAN: r0=120(x), r1=189(y), r2=75(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 189
LDI r2, 75
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
