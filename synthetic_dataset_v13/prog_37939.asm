; DESCRIPTION: Renders a cyan box of size 80x99 starting at (200, 132).
; PLAN: r0=200(x), r1=132(y), r2=80(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 132
LDI r2, 80
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
