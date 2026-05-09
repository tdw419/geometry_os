; DESCRIPTION: Places a cyan 25x65 rectangle at position (406, 2).
; PLAN: r0=406(x), r1=2(y), r2=25(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 2
LDI r2, 25
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
