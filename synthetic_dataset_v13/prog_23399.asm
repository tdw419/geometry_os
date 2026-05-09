; DESCRIPTION: Places a yellow 70x42 rectangle at position (233, 57).
; PLAN: r0=233(x), r1=57(y), r2=70(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 57
LDI r2, 70
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
