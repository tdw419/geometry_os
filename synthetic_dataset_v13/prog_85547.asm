; DESCRIPTION: Places a cyan 86x33 rectangle at position (81, 177).
; PLAN: r0=81(x), r1=177(y), r2=86(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 177
LDI r2, 86
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
