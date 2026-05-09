; DESCRIPTION: Renders a cyan box of size 97x49 starting at (368, 110).
; PLAN: r0=368(x), r1=110(y), r2=97(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 110
LDI r2, 97
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
