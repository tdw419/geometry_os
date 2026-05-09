; DESCRIPTION: Renders a green box of size 112x16 starting at (250, 195).
; PLAN: r0=250(x), r1=195(y), r2=112(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 195
LDI r2, 112
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
