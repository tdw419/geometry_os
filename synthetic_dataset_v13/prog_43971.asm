; DESCRIPTION: Places a red 43x61 rectangle at position (80, 57).
; PLAN: r0=80(x), r1=57(y), r2=43(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 57
LDI r2, 43
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
