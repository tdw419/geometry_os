; DESCRIPTION: Renders a cyan box of size 23x30 starting at (174, 140).
; PLAN: r0=174(x), r1=140(y), r2=23(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 140
LDI r2, 23
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
