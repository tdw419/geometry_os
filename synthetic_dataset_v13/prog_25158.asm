; DESCRIPTION: Renders a yellow box of size 32x24 starting at (362, 65).
; PLAN: r0=362(x), r1=65(y), r2=32(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 65
LDI r2, 32
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
