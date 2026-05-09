; DESCRIPTION: Renders a green box of size 44x19 starting at (73, 204).
; PLAN: r0=73(x), r1=204(y), r2=44(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 204
LDI r2, 44
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
