; DESCRIPTION: Renders a cyan box of size 106x24 starting at (351, 58).
; PLAN: r0=351(x), r1=58(y), r2=106(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 58
LDI r2, 106
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
