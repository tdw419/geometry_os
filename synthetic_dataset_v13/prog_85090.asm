; DESCRIPTION: Renders a green box of size 94x12 starting at (290, 174).
; PLAN: r0=290(x), r1=174(y), r2=94(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 174
LDI r2, 94
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
