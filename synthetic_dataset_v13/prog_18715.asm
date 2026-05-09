; DESCRIPTION: Renders a cyan box of size 99x75 starting at (311, 56).
; PLAN: r0=311(x), r1=56(y), r2=99(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 56
LDI r2, 99
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
