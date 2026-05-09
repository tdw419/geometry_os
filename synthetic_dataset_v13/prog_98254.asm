; DESCRIPTION: Renders a yellow box of size 98x32 starting at (140, 173).
; PLAN: r0=140(x), r1=173(y), r2=98(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 173
LDI r2, 98
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
