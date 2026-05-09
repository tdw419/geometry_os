; DESCRIPTION: Renders a cyan box of size 13x23 starting at (126, 138).
; PLAN: r0=126(x), r1=138(y), r2=13(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 138
LDI r2, 13
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
