; DESCRIPTION: Renders a yellow box of size 104x113 starting at (304, 0).
; PLAN: r0=304(x), r1=0(y), r2=104(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 0
LDI r2, 104
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
