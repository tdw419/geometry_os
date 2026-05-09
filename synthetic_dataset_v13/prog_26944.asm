; DESCRIPTION: Places a cyan 111x39 rectangle at position (97, 99).
; PLAN: r0=97(x), r1=99(y), r2=111(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 99
LDI r2, 111
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
