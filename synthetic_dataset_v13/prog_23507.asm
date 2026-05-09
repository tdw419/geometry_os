; DESCRIPTION: Renders a green box of size 120x45 starting at (284, 84).
; PLAN: r0=284(x), r1=84(y), r2=120(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 84
LDI r2, 120
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
