; DESCRIPTION: Places a cyan 10x15 rectangle at position (230, 190).
; PLAN: r0=230(x), r1=190(y), r2=10(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 190
LDI r2, 10
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
