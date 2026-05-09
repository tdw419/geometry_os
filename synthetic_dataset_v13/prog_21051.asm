; DESCRIPTION: Renders a cyan box of size 38x83 starting at (286, 85).
; PLAN: r0=286(x), r1=85(y), r2=38(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 85
LDI r2, 38
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
