; DESCRIPTION: Renders a cyan box of size 14x109 starting at (145, 48).
; PLAN: r0=145(x), r1=48(y), r2=14(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 48
LDI r2, 14
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
