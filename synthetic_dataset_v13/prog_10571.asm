; DESCRIPTION: Renders a cyan box of size 45x31 starting at (417, 163).
; PLAN: r0=417(x), r1=163(y), r2=45(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 163
LDI r2, 45
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
