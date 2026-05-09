; DESCRIPTION: Places a cyan 56x14 rectangle at position (408, 190).
; PLAN: r0=408(x), r1=190(y), r2=56(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 190
LDI r2, 56
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
