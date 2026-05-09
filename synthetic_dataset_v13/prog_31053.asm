; DESCRIPTION: Renders a yellow box of size 36x65 starting at (220, 50).
; PLAN: r0=220(x), r1=50(y), r2=36(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 50
LDI r2, 36
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
