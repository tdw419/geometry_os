; DESCRIPTION: Places a yellow 47x87 rectangle at position (75, 139).
; PLAN: r0=75(x), r1=139(y), r2=47(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 139
LDI r2, 47
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
