; DESCRIPTION: Renders a green box of size 24x98 starting at (108, 65).
; PLAN: r0=108(x), r1=65(y), r2=24(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 65
LDI r2, 24
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
