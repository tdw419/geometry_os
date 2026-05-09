; DESCRIPTION: Renders a cyan box of size 12x89 starting at (330, 21).
; PLAN: r0=330(x), r1=21(y), r2=12(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 21
LDI r2, 12
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
