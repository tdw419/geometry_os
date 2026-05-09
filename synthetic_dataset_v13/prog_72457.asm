; DESCRIPTION: Places a cyan 120x82 rectangle at position (378, 101).
; PLAN: r0=378(x), r1=101(y), r2=120(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 101
LDI r2, 120
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
