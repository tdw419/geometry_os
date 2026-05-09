; DESCRIPTION: Renders a yellow box of size 24x22 starting at (154, 186).
; PLAN: r0=154(x), r1=186(y), r2=24(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 186
LDI r2, 24
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
