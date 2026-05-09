; DESCRIPTION: Renders a purple box of size 89x53 starting at (284, 186).
; PLAN: r0=284(x), r1=186(y), r2=89(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 186
LDI r2, 89
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
