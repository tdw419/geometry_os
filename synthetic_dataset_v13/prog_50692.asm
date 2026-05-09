; DESCRIPTION: Renders a yellow box of size 65x57 starting at (109, 82).
; PLAN: r0=109(x), r1=82(y), r2=65(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 82
LDI r2, 65
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
