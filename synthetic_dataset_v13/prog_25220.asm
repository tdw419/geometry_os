; DESCRIPTION: Composite: Places a black dot at position (429, 120) then Places a yellow 34x100 rectangle at position (132, 58).
; PLAN: r0=429(x), r1=120(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=132(x), r6=58(y), r7=34(width), r8=100(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 429
LDI r1, 120
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 132
LDI r6, 58
LDI r7, 34
LDI r8, 100
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
