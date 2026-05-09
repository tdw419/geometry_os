; DESCRIPTION: Places a red 94x15 rectangle at position (159, 192).
; PLAN: r0=159(x), r1=192(y), r2=94(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 192
LDI r2, 94
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
