; DESCRIPTION: Places a cyan 61x78 rectangle at position (259, 124).
; PLAN: r0=259(x), r1=124(y), r2=61(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 124
LDI r2, 61
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
