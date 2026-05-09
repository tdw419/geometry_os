; DESCRIPTION: Places a red 74x66 rectangle at position (367, 16).
; PLAN: r0=367(x), r1=16(y), r2=74(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 16
LDI r2, 74
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
