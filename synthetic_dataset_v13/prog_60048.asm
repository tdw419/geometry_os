; DESCRIPTION: Places a yellow 47x102 rectangle at position (12, 93).
; PLAN: r0=12(x), r1=93(y), r2=47(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 93
LDI r2, 47
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
