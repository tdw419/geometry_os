; DESCRIPTION: Renders a yellow box of size 47x40 starting at (284, 115).
; PLAN: r0=284(x), r1=115(y), r2=47(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 115
LDI r2, 47
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
