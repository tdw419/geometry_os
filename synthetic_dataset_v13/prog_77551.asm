; DESCRIPTION: Renders a green box of size 28x39 starting at (448, 183).
; PLAN: r0=448(x), r1=183(y), r2=28(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 183
LDI r2, 28
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
