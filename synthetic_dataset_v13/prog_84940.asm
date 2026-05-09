; DESCRIPTION: Places a cyan 52x32 rectangle at position (140, 199).
; PLAN: r0=140(x), r1=199(y), r2=52(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 199
LDI r2, 52
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
