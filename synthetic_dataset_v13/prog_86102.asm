; DESCRIPTION: Renders a cyan box of size 80x117 starting at (381, 26).
; PLAN: r0=381(x), r1=26(y), r2=80(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 26
LDI r2, 80
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
