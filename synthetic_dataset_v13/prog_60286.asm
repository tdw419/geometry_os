; DESCRIPTION: Renders a cyan box of size 80x71 starting at (145, 168).
; PLAN: r0=145(x), r1=168(y), r2=80(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 168
LDI r2, 80
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
