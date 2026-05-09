; DESCRIPTION: Renders a black box of size 94x91 starting at (408, 144).
; PLAN: r0=408(x), r1=144(y), r2=94(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 144
LDI r2, 94
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
