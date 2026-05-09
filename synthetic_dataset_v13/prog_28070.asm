; DESCRIPTION: Composite: Places a black 74x22 rectangle at position (277, 137) then Places a green dot at position (252, 244).
; PLAN: r0=277(x), r1=137(y), r2=74(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=252(x), r6=244(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 277
LDI r1, 137
LDI r2, 74
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 244
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
