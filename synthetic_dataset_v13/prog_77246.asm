; DESCRIPTION: Renders a cyan box of size 10x98 starting at (12, 13).
; PLAN: r0=12(x), r1=13(y), r2=10(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 13
LDI r2, 10
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
