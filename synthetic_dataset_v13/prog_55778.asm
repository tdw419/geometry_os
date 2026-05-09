; DESCRIPTION: Renders a cyan box of size 71x98 starting at (359, 155).
; PLAN: r0=359(x), r1=155(y), r2=71(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 155
LDI r2, 71
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
