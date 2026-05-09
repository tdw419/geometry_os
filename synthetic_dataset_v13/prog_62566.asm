; DESCRIPTION: Composite: Places a orange dot at position (443, 224) then Draws a white line from (307, 152) to (19, 71).
; PLAN: r0=443(x), r1=224(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=307(x1), r6=152(y1), r7=19(x2), r8=71(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 443
LDI r1, 224
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 307
LDI r6, 152
LDI r7, 19
LDI r8, 71
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
