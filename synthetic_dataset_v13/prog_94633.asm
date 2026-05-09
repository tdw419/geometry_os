; DESCRIPTION: Renders a cyan box of size 90x106 starting at (44, 86).
; PLAN: r0=44(x), r1=86(y), r2=90(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 86
LDI r2, 90
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
