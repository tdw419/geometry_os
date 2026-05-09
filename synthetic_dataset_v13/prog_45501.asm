; DESCRIPTION: Composite: Renders a green line between points (85, 120) and (429, 163) then Places a purple 19x11 rectangle at position (304, 156).
; PLAN: r0=85(x1), r1=120(y1), r2=429(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=156(y), r7=19(width), r8=11(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 85
LDI r1, 120
LDI r2, 429
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 156
LDI r7, 19
LDI r8, 11
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
