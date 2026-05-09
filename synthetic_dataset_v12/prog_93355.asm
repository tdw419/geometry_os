; DESCRIPTION: Places a green 94x28 rectangle at position (378, 126).
; PLAN: r0=378(x), r1=126(y), r2=94(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 126
LDI r2, 94
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
