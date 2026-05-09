; DESCRIPTION: Renders a yellow box of size 108x107 starting at (307, 128).
; PLAN: r0=307(x), r1=128(y), r2=108(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 128
LDI r2, 108
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
