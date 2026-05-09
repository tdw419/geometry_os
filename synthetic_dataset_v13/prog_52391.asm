; DESCRIPTION: Renders a green box of size 55x47 starting at (8, 208).
; PLAN: r0=8(x), r1=208(y), r2=55(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 208
LDI r2, 55
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
