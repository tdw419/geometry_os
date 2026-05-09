; DESCRIPTION: Renders a cyan box of size 120x80 starting at (35, 123).
; PLAN: r0=35(x), r1=123(y), r2=120(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 123
LDI r2, 120
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
