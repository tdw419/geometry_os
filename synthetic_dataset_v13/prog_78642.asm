; DESCRIPTION: Renders a cyan box of size 31x45 starting at (95, 165).
; PLAN: r0=95(x), r1=165(y), r2=31(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 165
LDI r2, 31
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
