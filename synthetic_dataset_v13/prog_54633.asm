; DESCRIPTION: Renders a green box of size 79x44 starting at (57, 159).
; PLAN: r0=57(x), r1=159(y), r2=79(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 159
LDI r2, 79
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
