; DESCRIPTION: Renders a yellow box of size 24x72 starting at (69, 150).
; PLAN: r0=69(x), r1=150(y), r2=24(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 150
LDI r2, 24
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
