; DESCRIPTION: Renders a green box of size 63x25 starting at (411, 225).
; PLAN: r0=411(x), r1=225(y), r2=63(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 225
LDI r2, 63
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
