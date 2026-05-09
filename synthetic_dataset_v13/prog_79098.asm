; DESCRIPTION: Renders a cyan box of size 31x19 starting at (231, 7).
; PLAN: r0=231(x), r1=7(y), r2=31(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 7
LDI r2, 31
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
