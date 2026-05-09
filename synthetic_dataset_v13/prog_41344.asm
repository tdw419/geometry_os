; DESCRIPTION: Renders a black box of size 117x21 starting at (290, 126).
; PLAN: r0=290(x), r1=126(y), r2=117(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 126
LDI r2, 117
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
