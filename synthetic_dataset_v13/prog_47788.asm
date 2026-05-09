; DESCRIPTION: Renders a cyan box of size 98x39 starting at (97, 63).
; PLAN: r0=97(x), r1=63(y), r2=98(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 63
LDI r2, 98
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
