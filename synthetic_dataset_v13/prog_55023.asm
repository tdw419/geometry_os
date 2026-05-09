; DESCRIPTION: Composite: Renders a magenta line between points (111, 107) and (352, 50) then Places a black 42x83 rectangle at position (374, 128).
; PLAN: r0=111(x1), r1=107(y1), r2=352(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=374(x), r6=128(y), r7=42(width), r8=83(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 111
LDI r1, 107
LDI r2, 352
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 128
LDI r7, 42
LDI r8, 83
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
