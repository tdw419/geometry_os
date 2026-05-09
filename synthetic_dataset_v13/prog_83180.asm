; DESCRIPTION: Places a green 93x12 rectangle at position (295, 61).
; PLAN: r0=295(x), r1=61(y), r2=93(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 61
LDI r2, 93
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
