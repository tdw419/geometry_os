; DESCRIPTION: Renders a cyan box of size 12x108 starting at (110, 13).
; PLAN: r0=110(x), r1=13(y), r2=12(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 13
LDI r2, 12
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
