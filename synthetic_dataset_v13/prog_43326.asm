; DESCRIPTION: Renders a cyan box of size 31x23 starting at (261, 126).
; PLAN: r0=261(x), r1=126(y), r2=31(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 126
LDI r2, 31
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
