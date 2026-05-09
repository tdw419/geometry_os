; DESCRIPTION: Places a cyan 35x82 rectangle at position (75, 109).
; PLAN: r0=75(x), r1=109(y), r2=35(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 109
LDI r2, 35
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
