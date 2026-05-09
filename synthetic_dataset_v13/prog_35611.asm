; DESCRIPTION: Renders a green box of size 107x13 starting at (281, 39).
; PLAN: r0=281(x), r1=39(y), r2=107(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 39
LDI r2, 107
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
