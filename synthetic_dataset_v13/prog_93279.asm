; DESCRIPTION: Composite: Places a cyan line segment connecting (381, 111) to (26, 154) then Places a yellow 61x82 rectangle at position (60, 72).
; PLAN: r0=381(x1), r1=111(y1), r2=26(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=72(y), r7=61(width), r8=82(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 111
LDI r2, 26
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 72
LDI r7, 61
LDI r8, 82
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
