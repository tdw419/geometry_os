; DESCRIPTION: Places a red 102x68 rectangle at position (66, 93).
; PLAN: r0=66(x), r1=93(y), r2=102(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 93
LDI r2, 102
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
