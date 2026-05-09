; DESCRIPTION: Renders a cyan box of size 74x111 starting at (159, 65).
; PLAN: r0=159(x), r1=65(y), r2=74(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 65
LDI r2, 74
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
