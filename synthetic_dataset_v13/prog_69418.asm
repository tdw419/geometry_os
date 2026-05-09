; DESCRIPTION: Renders a cyan box of size 28x44 starting at (363, 123).
; PLAN: r0=363(x), r1=123(y), r2=28(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 123
LDI r2, 28
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
