; DESCRIPTION: Renders a cyan box of size 107x10 starting at (319, 173).
; PLAN: r0=319(x), r1=173(y), r2=107(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 173
LDI r2, 107
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
