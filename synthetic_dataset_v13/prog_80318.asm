; DESCRIPTION: Renders a cyan box of size 104x79 starting at (215, 1).
; PLAN: r0=215(x), r1=1(y), r2=104(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 1
LDI r2, 104
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
