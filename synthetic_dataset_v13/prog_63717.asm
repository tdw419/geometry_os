; DESCRIPTION: Renders a cyan box of size 78x26 starting at (7, 218).
; PLAN: r0=7(x), r1=218(y), r2=78(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 218
LDI r2, 78
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
