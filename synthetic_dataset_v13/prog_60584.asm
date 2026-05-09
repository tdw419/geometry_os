; DESCRIPTION: Places a black 90x24 rectangle at position (16, 199).
; PLAN: r0=16(x), r1=199(y), r2=90(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 199
LDI r2, 90
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
