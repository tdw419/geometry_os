; DESCRIPTION: Places a white 46x110 rectangle at position (190, 117).
; PLAN: r0=190(x), r1=117(y), r2=46(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 117
LDI r2, 46
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
