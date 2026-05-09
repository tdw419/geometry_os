; DESCRIPTION: Renders a cyan box of size 11x109 starting at (368, 147).
; PLAN: r0=368(x), r1=147(y), r2=11(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 147
LDI r2, 11
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
