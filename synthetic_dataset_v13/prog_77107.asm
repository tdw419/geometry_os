; DESCRIPTION: Composite: Places a red dot at position (16, 16) then Places a cyan line segment connecting (327, 50) to (328, 180).
; PLAN: r0=16(x), r1=16(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=327(x1), r6=50(y1), r7=328(x2), r8=180(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 16
LDI r1, 16
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 327
LDI r6, 50
LDI r7, 328
LDI r8, 180
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
