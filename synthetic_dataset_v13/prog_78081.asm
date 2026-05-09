; DESCRIPTION: Places a cyan 85x59 rectangle at position (417, 25).
; PLAN: r0=417(x), r1=25(y), r2=85(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 25
LDI r2, 85
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
