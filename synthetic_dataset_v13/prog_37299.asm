; DESCRIPTION: Places a red 44x45 rectangle at position (380, 139).
; PLAN: r0=380(x), r1=139(y), r2=44(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 139
LDI r2, 44
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
