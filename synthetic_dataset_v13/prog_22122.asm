; DESCRIPTION: Renders a cyan box of size 87x83 starting at (144, 114).
; PLAN: r0=144(x), r1=114(y), r2=87(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 114
LDI r2, 87
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
