; DESCRIPTION: Renders a cyan box of size 68x84 starting at (351, 23).
; PLAN: r0=351(x), r1=23(y), r2=68(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 23
LDI r2, 68
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
