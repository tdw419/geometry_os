; DESCRIPTION: Renders a cyan box of size 118x98 starting at (160, 136).
; PLAN: r0=160(x), r1=136(y), r2=118(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 136
LDI r2, 118
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
