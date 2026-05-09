; DESCRIPTION: Renders a cyan box of size 34x80 starting at (363, 118).
; PLAN: r0=363(x), r1=118(y), r2=34(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 118
LDI r2, 34
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
