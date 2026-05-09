; DESCRIPTION: Places a white 21x75 rectangle at position (190, 59).
; PLAN: r0=190(x), r1=59(y), r2=21(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 59
LDI r2, 21
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
