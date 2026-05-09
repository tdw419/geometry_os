; DESCRIPTION: Renders a cyan box of size 35x27 starting at (417, 212).
; PLAN: r0=417(x), r1=212(y), r2=35(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 212
LDI r2, 35
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
