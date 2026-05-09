; DESCRIPTION: Composite: Places a green dot at position (69, 173) then Places a white line segment connecting (405, 96) to (268, 234).
; PLAN: r0=69(x), r1=173(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=405(x1), r6=96(y1), r7=268(x2), r8=234(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 69
LDI r1, 173
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 405
LDI r6, 96
LDI r7, 268
LDI r8, 234
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
