; DESCRIPTION: Renders a cyan box of size 99x40 starting at (47, 44).
; PLAN: r0=47(x), r1=44(y), r2=99(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 44
LDI r2, 99
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
