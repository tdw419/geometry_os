; DESCRIPTION: Composite: Renders a cyan line between points (409, 92) and (171, 250) then Renders a black box of size 49x27 starting at (299, 58).
; PLAN: r0=409(x1), r1=92(y1), r2=171(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=58(y), r7=49(width), r8=27(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 92
LDI r2, 171
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 58
LDI r7, 49
LDI r8, 27
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
