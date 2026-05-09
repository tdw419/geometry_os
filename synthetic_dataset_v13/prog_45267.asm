; DESCRIPTION: Renders a green box of size 108x80 starting at (284, 117).
; PLAN: r0=284(x), r1=117(y), r2=108(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 117
LDI r2, 108
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
