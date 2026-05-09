; DESCRIPTION: Renders a green box of size 41x80 starting at (73, 86).
; PLAN: r0=73(x), r1=86(y), r2=41(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 86
LDI r2, 41
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
