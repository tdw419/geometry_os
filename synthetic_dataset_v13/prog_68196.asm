; DESCRIPTION: Composite: Places a green dot at position (386, 0) then Places a green 38x66 rectangle at position (392, 147).
; PLAN: r0=386(x), r1=0(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=392(x), r6=147(y), r7=38(width), r8=66(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 386
LDI r1, 0
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 392
LDI r6, 147
LDI r7, 38
LDI r8, 66
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
