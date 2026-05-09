; DESCRIPTION: Places a cyan 92x26 rectangle at position (87, 153).
; PLAN: r0=87(x), r1=153(y), r2=92(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 153
LDI r2, 92
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
