; DESCRIPTION: Renders a cyan box of size 10x98 starting at (341, 44).
; PLAN: r0=341(x), r1=44(y), r2=10(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 44
LDI r2, 10
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
