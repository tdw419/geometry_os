; DESCRIPTION: Places a red 106x39 rectangle at position (68, 139).
; PLAN: r0=68(x), r1=139(y), r2=106(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 139
LDI r2, 106
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
