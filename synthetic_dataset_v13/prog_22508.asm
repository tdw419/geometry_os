; DESCRIPTION: Renders a yellow box of size 109x47 starting at (237, 71).
; PLAN: r0=237(x), r1=71(y), r2=109(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 71
LDI r2, 109
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
