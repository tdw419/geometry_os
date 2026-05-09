; DESCRIPTION: Renders a cyan box of size 117x15 starting at (351, 33).
; PLAN: r0=351(x), r1=33(y), r2=117(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 33
LDI r2, 117
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
