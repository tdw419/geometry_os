; DESCRIPTION: Places a cyan 52x21 rectangle at position (90, 15).
; PLAN: r0=90(x), r1=15(y), r2=52(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 15
LDI r2, 52
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
