; DESCRIPTION: Renders a yellow box of size 37x47 starting at (284, 63).
; PLAN: r0=284(x), r1=63(y), r2=37(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 63
LDI r2, 37
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
