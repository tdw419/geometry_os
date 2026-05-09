; DESCRIPTION: Renders a cyan box of size 15x65 starting at (201, 38).
; PLAN: r0=201(x), r1=38(y), r2=15(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 38
LDI r2, 15
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
