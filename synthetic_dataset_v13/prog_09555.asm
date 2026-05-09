; DESCRIPTION: Renders a cyan box of size 106x97 starting at (2, 110).
; PLAN: r0=2(x), r1=110(y), r2=106(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 110
LDI r2, 106
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
