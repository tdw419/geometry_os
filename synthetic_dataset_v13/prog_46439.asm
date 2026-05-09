; DESCRIPTION: Places a cyan 50x50 rectangle at position (378, 159).
; PLAN: r0=378(x), r1=159(y), r2=50(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 159
LDI r2, 50
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
