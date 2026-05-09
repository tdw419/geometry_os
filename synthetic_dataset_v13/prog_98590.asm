; DESCRIPTION: Renders a yellow box of size 82x68 starting at (406, 6).
; PLAN: r0=406(x), r1=6(y), r2=82(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 6
LDI r2, 82
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
