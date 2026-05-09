; DESCRIPTION: Renders a cyan box of size 33x58 starting at (192, 93).
; PLAN: r0=192(x), r1=93(y), r2=33(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 93
LDI r2, 33
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
