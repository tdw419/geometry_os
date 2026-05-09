; DESCRIPTION: Places a yellow 27x106 rectangle at position (69, 139).
; PLAN: r0=69(x), r1=139(y), r2=27(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 139
LDI r2, 27
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
