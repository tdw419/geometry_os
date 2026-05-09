; DESCRIPTION: Renders a yellow box of size 50x86 starting at (99, 16).
; PLAN: r0=99(x), r1=16(y), r2=50(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 16
LDI r2, 50
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
