; DESCRIPTION: Renders a yellow box of size 12x86 starting at (0, 83).
; PLAN: r0=0(x), r1=83(y), r2=12(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 83
LDI r2, 12
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
