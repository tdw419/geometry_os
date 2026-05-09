; DESCRIPTION: Renders a cyan box of size 73x110 starting at (99, 60).
; PLAN: r0=99(x), r1=60(y), r2=73(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 60
LDI r2, 73
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
