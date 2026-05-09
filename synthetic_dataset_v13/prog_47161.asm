; DESCRIPTION: Places a cyan 66x116 rectangle at position (270, 102).
; PLAN: r0=270(x), r1=102(y), r2=66(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 102
LDI r2, 66
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
