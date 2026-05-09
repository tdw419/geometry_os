; DESCRIPTION: Renders a cyan box of size 119x34 starting at (380, 104).
; PLAN: r0=380(x), r1=104(y), r2=119(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 104
LDI r2, 119
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
