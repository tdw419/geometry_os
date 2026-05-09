; DESCRIPTION: Places a cyan 58x100 rectangle at position (82, 93).
; PLAN: r0=82(x), r1=93(y), r2=58(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 93
LDI r2, 58
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
