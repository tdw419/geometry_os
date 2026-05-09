; DESCRIPTION: Renders a cyan box of size 94x112 starting at (99, 36).
; PLAN: r0=99(x), r1=36(y), r2=94(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 36
LDI r2, 94
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
