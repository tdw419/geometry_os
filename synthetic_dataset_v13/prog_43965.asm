; DESCRIPTION: Renders a cyan box of size 11x108 starting at (152, 144).
; PLAN: r0=152(x), r1=144(y), r2=11(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 144
LDI r2, 11
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
