; DESCRIPTION: Places a cyan 25x72 rectangle at position (220, 82).
; PLAN: r0=220(x), r1=82(y), r2=25(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 82
LDI r2, 25
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
