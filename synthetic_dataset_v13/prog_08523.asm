; DESCRIPTION: Renders a cyan box of size 40x110 starting at (175, 68).
; PLAN: r0=175(x), r1=68(y), r2=40(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 68
LDI r2, 40
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
