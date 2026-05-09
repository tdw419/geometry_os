; DESCRIPTION: Renders a yellow box of size 114x96 starting at (392, 50).
; PLAN: r0=392(x), r1=50(y), r2=114(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 50
LDI r2, 114
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
