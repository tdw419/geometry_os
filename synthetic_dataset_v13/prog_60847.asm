; DESCRIPTION: Places a cyan 11x83 rectangle at position (146, 109).
; PLAN: r0=146(x), r1=109(y), r2=11(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 109
LDI r2, 11
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
