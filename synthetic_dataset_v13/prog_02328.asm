; DESCRIPTION: Renders a cyan box of size 24x108 starting at (209, 98).
; PLAN: r0=209(x), r1=98(y), r2=24(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 98
LDI r2, 24
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
