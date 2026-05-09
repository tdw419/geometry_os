; DESCRIPTION: Renders a cyan box of size 44x26 starting at (188, 23).
; PLAN: r0=188(x), r1=23(y), r2=44(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 23
LDI r2, 44
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
