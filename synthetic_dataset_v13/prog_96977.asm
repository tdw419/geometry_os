; DESCRIPTION: Renders a cyan box of size 83x16 starting at (302, 90).
; PLAN: r0=302(x), r1=90(y), r2=83(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 90
LDI r2, 83
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
