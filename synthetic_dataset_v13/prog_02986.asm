; DESCRIPTION: Renders a cyan box of size 70x70 starting at (104, 9).
; PLAN: r0=104(x), r1=9(y), r2=70(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 9
LDI r2, 70
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
