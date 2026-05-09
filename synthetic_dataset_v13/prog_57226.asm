; DESCRIPTION: Places a cyan 30x64 rectangle at position (81, 102).
; PLAN: r0=81(x), r1=102(y), r2=30(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 102
LDI r2, 30
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
