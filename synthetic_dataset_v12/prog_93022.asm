; DESCRIPTION: Places a cyan 107x56 rectangle at position (153, 190).
; PLAN: r0=153(x), r1=190(y), r2=107(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 190
LDI r2, 107
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
