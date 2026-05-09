; DESCRIPTION: Renders a yellow box of size 79x60 starting at (271, 29).
; PLAN: r0=271(x), r1=29(y), r2=79(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 29
LDI r2, 79
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
