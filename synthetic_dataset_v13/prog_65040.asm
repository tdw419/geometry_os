; DESCRIPTION: Places a cyan 74x59 rectangle at position (262, 190).
; PLAN: r0=262(x), r1=190(y), r2=74(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 190
LDI r2, 74
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
