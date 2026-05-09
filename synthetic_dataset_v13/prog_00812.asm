; DESCRIPTION: Places a white 105x30 rectangle at position (190, 11).
; PLAN: r0=190(x), r1=11(y), r2=105(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 11
LDI r2, 105
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
