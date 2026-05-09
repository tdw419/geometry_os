; DESCRIPTION: Places a green 104x79 rectangle at position (190, 139).
; PLAN: r0=190(x), r1=139(y), r2=104(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 139
LDI r2, 104
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
