; DESCRIPTION: Places a red 29x84 rectangle at position (50, 139).
; PLAN: r0=50(x), r1=139(y), r2=29(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 139
LDI r2, 29
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
