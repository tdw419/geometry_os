; DESCRIPTION: Places a white 115x18 rectangle at position (50, 190).
; PLAN: r0=50(x), r1=190(y), r2=115(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 190
LDI r2, 115
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
