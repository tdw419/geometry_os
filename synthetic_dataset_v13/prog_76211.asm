; DESCRIPTION: Composite: Places a cyan dot at position (189, 124) then Renders a red box of size 104x22 starting at (94, 189).
; PLAN: r0=189(x), r1=124(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=94(x), r6=189(y), r7=104(width), r8=22(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 124
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 94
LDI r6, 189
LDI r7, 104
LDI r8, 22
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
