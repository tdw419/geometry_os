; DESCRIPTION: Renders a cyan box of size 106x29 starting at (63, 104).
; PLAN: r0=63(x), r1=104(y), r2=106(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 104
LDI r2, 106
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
