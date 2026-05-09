; DESCRIPTION: Renders a cyan box of size 95x34 starting at (211, 85).
; PLAN: r0=211(x), r1=85(y), r2=95(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 85
LDI r2, 95
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
