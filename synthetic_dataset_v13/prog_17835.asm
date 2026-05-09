; DESCRIPTION: Renders a yellow box of size 104x45 starting at (57, 50).
; PLAN: r0=57(x), r1=50(y), r2=104(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 50
LDI r2, 104
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
