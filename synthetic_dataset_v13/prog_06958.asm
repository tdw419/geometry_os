; DESCRIPTION: Places a cyan 29x46 rectangle at position (193, 75).
; PLAN: r0=193(x), r1=75(y), r2=29(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 75
LDI r2, 29
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
