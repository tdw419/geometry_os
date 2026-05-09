; DESCRIPTION: Renders a yellow box of size 50x40 starting at (186, 8).
; PLAN: r0=186(x), r1=8(y), r2=50(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 8
LDI r2, 50
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
