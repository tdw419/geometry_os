; DESCRIPTION: Renders a green box of size 52x20 starting at (346, 208).
; PLAN: r0=346(x), r1=208(y), r2=52(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 208
LDI r2, 52
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
