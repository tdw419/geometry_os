; DESCRIPTION: Places a cyan 85x44 rectangle at position (82, 36).
; PLAN: r0=82(x), r1=36(y), r2=85(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 36
LDI r2, 85
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
