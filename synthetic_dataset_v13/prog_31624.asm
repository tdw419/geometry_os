; DESCRIPTION: Renders a yellow box of size 47x63 starting at (21, 107).
; PLAN: r0=21(x), r1=107(y), r2=47(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 107
LDI r2, 47
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
