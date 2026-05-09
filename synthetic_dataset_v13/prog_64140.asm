; DESCRIPTION: Places a cyan 57x46 rectangle at position (375, 190).
; PLAN: r0=375(x), r1=190(y), r2=57(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 190
LDI r2, 57
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
