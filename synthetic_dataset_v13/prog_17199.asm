; DESCRIPTION: Renders a green box of size 24x19 starting at (166, 208).
; PLAN: r0=166(x), r1=208(y), r2=24(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 208
LDI r2, 24
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
