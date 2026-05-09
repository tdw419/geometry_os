; DESCRIPTION: Renders a cyan box of size 37x74 starting at (431, 168).
; PLAN: r0=431(x), r1=168(y), r2=37(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 168
LDI r2, 37
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
