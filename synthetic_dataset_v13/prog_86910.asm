; DESCRIPTION: Renders a cyan box of size 47x23 starting at (2, 109).
; PLAN: r0=2(x), r1=109(y), r2=47(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 109
LDI r2, 47
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
