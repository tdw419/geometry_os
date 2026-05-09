; DESCRIPTION: Places a cyan 61x74 rectangle at position (81, 54).
; PLAN: r0=81(x), r1=54(y), r2=61(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 54
LDI r2, 61
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
