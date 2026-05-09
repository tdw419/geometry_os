; DESCRIPTION: Renders a cyan box of size 99x32 starting at (129, 93).
; PLAN: r0=129(x), r1=93(y), r2=99(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 93
LDI r2, 99
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
