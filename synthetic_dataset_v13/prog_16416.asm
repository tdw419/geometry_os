; DESCRIPTION: Renders a cyan box of size 104x19 starting at (169, 82).
; PLAN: r0=169(x), r1=82(y), r2=104(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 82
LDI r2, 104
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
