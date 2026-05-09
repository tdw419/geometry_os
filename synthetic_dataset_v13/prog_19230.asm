; DESCRIPTION: Composite: Places a green dot at position (200, 248) then Renders a yellow box of size 41x115 starting at (416, 117).
; PLAN: r0=200(x), r1=248(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=416(x), r6=117(y), r7=41(width), r8=115(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 200
LDI r1, 248
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 416
LDI r6, 117
LDI r7, 41
LDI r8, 115
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
