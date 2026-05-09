; DESCRIPTION: Renders a cyan box of size 34x110 starting at (26, 16).
; PLAN: r0=26(x), r1=16(y), r2=34(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 16
LDI r2, 34
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
