; DESCRIPTION: Renders a yellow box of size 29x115 starting at (408, 80).
; PLAN: r0=408(x), r1=80(y), r2=29(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 80
LDI r2, 29
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
