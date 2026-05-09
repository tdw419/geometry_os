; DESCRIPTION: Renders a cyan box of size 60x44 starting at (204, 58).
; PLAN: r0=204(x), r1=58(y), r2=60(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 58
LDI r2, 60
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
