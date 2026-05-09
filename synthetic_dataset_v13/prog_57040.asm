; DESCRIPTION: Renders a cyan box of size 102x56 starting at (195, 156).
; PLAN: r0=195(x), r1=156(y), r2=102(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 156
LDI r2, 102
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
