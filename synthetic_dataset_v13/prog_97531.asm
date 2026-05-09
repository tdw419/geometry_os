; DESCRIPTION: Composite: Places a red dot at position (239, 110) then Draws a cyan line from (135, 36) to (401, 13).
; PLAN: r0=239(x), r1=110(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=135(x1), r6=36(y1), r7=401(x2), r8=13(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 239
LDI r1, 110
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 135
LDI r6, 36
LDI r7, 401
LDI r8, 13
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
