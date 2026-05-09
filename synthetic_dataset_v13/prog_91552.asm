; DESCRIPTION: Renders a cyan box of size 23x98 starting at (6, 120).
; PLAN: r0=6(x), r1=120(y), r2=23(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 120
LDI r2, 23
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
