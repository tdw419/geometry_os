; DESCRIPTION: Renders a cyan box of size 91x54 starting at (193, 131).
; PLAN: r0=193(x), r1=131(y), r2=91(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 131
LDI r2, 91
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
