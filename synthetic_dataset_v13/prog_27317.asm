; DESCRIPTION: Places a cyan 38x119 rectangle at position (82, 44).
; PLAN: r0=82(x), r1=44(y), r2=38(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 44
LDI r2, 38
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
