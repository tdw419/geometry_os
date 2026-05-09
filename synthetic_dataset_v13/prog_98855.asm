; DESCRIPTION: Places a cyan 59x90 rectangle at position (110, 26).
; PLAN: r0=110(x), r1=26(y), r2=59(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 26
LDI r2, 59
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
