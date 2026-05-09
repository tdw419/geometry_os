; DESCRIPTION: Places a green 115x28 rectangle at position (225, 93).
; PLAN: r0=225(x), r1=93(y), r2=115(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 93
LDI r2, 115
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
