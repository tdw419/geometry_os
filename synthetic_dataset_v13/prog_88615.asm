; DESCRIPTION: Renders a cyan box of size 80x97 starting at (36, 22).
; PLAN: r0=36(x), r1=22(y), r2=80(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 22
LDI r2, 80
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
