; DESCRIPTION: Renders a yellow box of size 109x115 starting at (214, 98).
; PLAN: r0=214(x), r1=98(y), r2=109(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 98
LDI r2, 109
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
