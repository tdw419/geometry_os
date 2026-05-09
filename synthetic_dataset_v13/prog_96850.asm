; DESCRIPTION: Places a white 65x74 rectangle at position (178, 139).
; PLAN: r0=178(x), r1=139(y), r2=65(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 139
LDI r2, 65
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
