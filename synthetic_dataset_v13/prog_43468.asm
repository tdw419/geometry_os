; DESCRIPTION: Renders a cyan box of size 57x80 starting at (60, 66).
; PLAN: r0=60(x), r1=66(y), r2=57(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 66
LDI r2, 57
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
