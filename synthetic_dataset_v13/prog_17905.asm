; DESCRIPTION: Places a cyan 17x75 rectangle at position (304, 82).
; PLAN: r0=304(x), r1=82(y), r2=17(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 82
LDI r2, 17
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
