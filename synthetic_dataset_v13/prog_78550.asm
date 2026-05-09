; DESCRIPTION: Renders a yellow box of size 91x82 starting at (164, 40).
; PLAN: r0=164(x), r1=40(y), r2=91(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 40
LDI r2, 91
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
