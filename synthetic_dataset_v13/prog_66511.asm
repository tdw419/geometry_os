; DESCRIPTION: Renders a green box of size 46x86 starting at (99, 169).
; PLAN: r0=99(x), r1=169(y), r2=46(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 169
LDI r2, 46
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
