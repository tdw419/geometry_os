; DESCRIPTION: Renders a green box of size 117x12 starting at (386, 204).
; PLAN: r0=386(x), r1=204(y), r2=117(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 204
LDI r2, 117
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
