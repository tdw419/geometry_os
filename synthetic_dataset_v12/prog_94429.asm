; DESCRIPTION: Renders a cyan box of size 81x98 starting at (204, 17).
; PLAN: r0=204(x), r1=17(y), r2=81(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 17
LDI r2, 81
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
