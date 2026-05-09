; DESCRIPTION: Composite: Places a green dot at position (227, 70) then Renders a yellow box of size 30x23 starting at (80, 153).
; PLAN: r0=227(x), r1=70(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=80(x), r6=153(y), r7=30(width), r8=23(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 227
LDI r1, 70
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 80
LDI r6, 153
LDI r7, 30
LDI r8, 23
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
