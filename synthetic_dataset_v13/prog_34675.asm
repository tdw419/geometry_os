; DESCRIPTION: Renders a green box of size 53x79 starting at (221, 159).
; PLAN: r0=221(x), r1=159(y), r2=53(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 159
LDI r2, 53
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
