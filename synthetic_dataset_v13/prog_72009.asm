; DESCRIPTION: Renders a cyan box of size 95x60 starting at (94, 138).
; PLAN: r0=94(x), r1=138(y), r2=95(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 138
LDI r2, 95
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
