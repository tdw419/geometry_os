; DESCRIPTION: Composite: Places a magenta dot at position (206, 14) then Renders a cyan line between points (284, 64) and (307, 45).
; PLAN: r0=206(x), r1=14(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=284(x1), r6=64(y1), r7=307(x2), r8=45(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 206
LDI r1, 14
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 284
LDI r6, 64
LDI r7, 307
LDI r8, 45
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
