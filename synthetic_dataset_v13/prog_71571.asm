; DESCRIPTION: Renders a cyan box of size 97x95 starting at (390, 31).
; PLAN: r0=390(x), r1=31(y), r2=97(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 31
LDI r2, 97
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
