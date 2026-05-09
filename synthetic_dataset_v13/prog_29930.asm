; DESCRIPTION: Renders a yellow box of size 112x104 starting at (154, 144).
; PLAN: r0=154(x), r1=144(y), r2=112(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 144
LDI r2, 112
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
