; DESCRIPTION: Renders a yellow box of size 57x57 starting at (248, 173).
; PLAN: r0=248(x), r1=173(y), r2=57(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 173
LDI r2, 57
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
