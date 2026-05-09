; DESCRIPTION: Places a cyan 90x37 rectangle at position (317, 135).
; PLAN: r0=317(x), r1=135(y), r2=90(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 135
LDI r2, 90
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
