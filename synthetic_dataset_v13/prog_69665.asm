; DESCRIPTION: Places a cyan 101x30 rectangle at position (218, 190).
; PLAN: r0=218(x), r1=190(y), r2=101(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 190
LDI r2, 101
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
