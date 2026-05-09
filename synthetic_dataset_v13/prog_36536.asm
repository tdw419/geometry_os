; DESCRIPTION: Renders a black box of size 111x48 starting at (220, 159).
; PLAN: r0=220(x), r1=159(y), r2=111(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 159
LDI r2, 111
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
